import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/ui/screens/shoppingitemdetails/cubit/shopping_item_details_cubit.dart';
import 'package:shopping_list/ui/widgets/loading.dart';

class ShoppingItemDetailsScreen extends StatefulWidget {
  @override
  _ShoppingItemDetailsScreenState createState() =>
      _ShoppingItemDetailsScreenState();
}

class _ShoppingItemDetailsScreenState extends State<ShoppingItemDetailsScreen> {
  String _category = "";
  final _shoppingItemController = TextEditingController();
  ShoppingListValueItem _initialShoppingValueItem;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _initialShoppingValueItem =
            ModalRoute.of(context).settings.arguments as ShoppingListValueItem;
        _category = _initialShoppingValueItem.category;
        _shoppingItemController.text = _initialShoppingValueItem.name;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoBlocProvider<ShoppingItemDetailsCubit>(
      child: BlocBuilder<ShoppingItemDetailsCubit, ShoppingItemDetailsState>(
        builder: (context, state) {
          return state.when(
              loading: () => SimpleLoadingIndicator(),
              loaded: (categories) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      _shoppingItemController.text,
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(Spaces.space_4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.of(context).shoppingItemDetailsHeadline,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: Spaces.space_6,
                        ),
                        TextField(
                          controller: _shoppingItemController,
                          decoration: InputDecoration(
                            labelText: S.of(context).shoppingItemDetailsItemInputHint,
                          ),
                        ),
                        SizedBox(
                          height: Spaces.space_6,
                        ),
                        DropdownButton(
                          value: _category,
                          items: [
                            for (var cat in categories)
                              DropdownMenuItem(
                                child: Text(cat.name),
                                value: cat.name,
                              )
                          ],
                          onChanged: (category) {
                            setState(() {
                              _category = category;
                            });
                          },
                        ),
                        SizedBox(
                          height: Spaces.space_6,
                        ),
                        RaisedButton(
                          child:
                          Text(S.of(context).shoppingItemDetailsButtonSave),
                          onPressed: () {
                            context
                                .read<ShoppingItemDetailsCubit>()
                                .editShoppingItem(
                                newItem: ShoppingListValueItem(
                                    name: _shoppingItemController.text,
                                    category: _category),
                                oldItem: _initialShoppingValueItem)
                                .then((value) => Routes.pop(context));
                          },
                        ),
                        RaisedButton(
                          child:
                          Text(S.of(context).shoppingItemDetailsButtonEditCategories),
                          onPressed: () => Routes.openCategories(context),
                        ),
                        RaisedButton(
                          color: Colors.red,
                          child: Text(
                              S.of(context).shoppingItemDetailsButtonDelete),
                          onPressed: () {
                            context
                                .read<ShoppingItemDetailsCubit>()
                                .deleteShoppingItem(_initialShoppingValueItem)
                                .then((value) => Routes.pop(context));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
