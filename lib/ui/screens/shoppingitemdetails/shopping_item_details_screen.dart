import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_model.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/ui/screens/shoppingitemdetails/cubit/shopping_item_details_cubit.dart';
import 'package:shopping_list/ui/widgets/loading.dart';
import 'package:shopping_list/ui/widgets/primary_button.dart';
import 'package:shopping_list/ui/widgets/secondary_button.dart';

class ShoppingItemDetailsScreen extends StatefulWidget {
  @override
  _ShoppingItemDetailsScreenState createState() =>
      _ShoppingItemDetailsScreenState();
}

class _ShoppingItemDetailsScreenState extends State<ShoppingItemDetailsScreen> {
  String _category = "";
  final _shoppingItemController = TextEditingController();
  ShoppingListValueItem _initialShoppingValueItem;
  ShoppingItemEditType editType;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        ShoppingItemEditModel editModel =
            ModalRoute.of(context).settings.arguments as ShoppingItemEditModel;
        if (editModel == null) {
          SnackBar snackBar = SnackBar(
            content: Text("FAILURE"),
          );
        } else {
          _initialShoppingValueItem = editModel.shoppingItem;
          editType = editModel.itemType;
          _category = _initialShoppingValueItem.category;
          _shoppingItemController.text = _initialShoppingValueItem.name;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoBlocProvider<ShoppingItemDetailsCubit>(
      child: BlocBuilder<ShoppingItemDetailsCubit, ShoppingItemDetailsState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  _shoppingItemController.text,
                ),
              ),
              body: state.when(
                loading: () => SimpleLoadingIndicator(),
                loaded: (categories) {
                  return Padding(
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
                            labelText:
                                S.of(context).shoppingItemDetailsItemInputHint,
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
                        PrimaryButton(
                          text: S.of(context).shoppingItemDetailsButtonSave,
                          onPressed: () {
                            context
                                .read<ShoppingItemDetailsCubit>()
                                .editShoppingItem(
                                    editType: editType,
                                    newItem: ShoppingListValueItem(
                                      name: _shoppingItemController.text,
                                      category: _category,
                                    ),
                                    oldItem: _initialShoppingValueItem)
                                .then((value) => Routes.pop(context));
                          },
                        ),
                        SecondaryButton(
                          text: S
                              .of(context)
                              .shoppingItemDetailsButtonEditCategories,
                          onPressed: () => Routes.openCategories(context),
                        ),
                        SecondaryButton(
                          text: S.of(context).shoppingItemDetailsButtonDelete,
                          onPressed: () {
                            context
                                .read<ShoppingItemDetailsCubit>()
                                .deleteShoppingItem(
                                    editType: editType,
                                    item: _initialShoppingValueItem)
                                .then((value) => Routes.pop(context));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
