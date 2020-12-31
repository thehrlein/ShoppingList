import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/shopping/shopping_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/ui/screens/shoppinglist/cubit/shopping_list_cubit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoBlocProvider<ShoppingListCubit>(
      child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).shoppingListTitle),
            ),
            body: Padding(
              padding: const EdgeInsets.all(Spaces.space_4),
              child: RefreshIndicator(
                child: state.when(
                  loading: _showLoading,
                  loaded: (list) => Column(
                    children: [
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          autofocus: false,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        suggestionsCallback: (input) async {
                          return context
                              .read<ShoppingListCubit>()
                              .getQuerySuggestions(input);
                        },
                        itemBuilder: (context, suggestion) {
                          ShoppingItem item = suggestion;
                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.category),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          context
                              .read<ShoppingListCubit>()
                              .onSuggestionSelected(suggestion);
                        },
                      ),
                      _showShoppingList(list)
                    ],
                  ),
                ),
                onRefresh: () =>
                    context.read<ShoppingListCubit>().refreshShoppingList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _showShoppingList(ShoppingList shoppingList) {
    // List<ShoppingItem> nonNullList = shoppingList.items.where((element) => element.ca != null && element.dish != null).toList();
    // List<ShoppingItem> filteredItems = List();
    // for (var day in MenuPlanDay.values) {
    //   MenuPlanItem item = nonNullList.firstWhere((element) => element.day == day, orElse: () => null);
    //   if (item != null) {
    //     filteredItems.add(item);
    //   }
    // }
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ShoppingItem item = shoppingList.items[index];
          return _createShoppingItem(item);
        },
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).accentColor,
        ),
        itemCount: shoppingList.items.length,
      ),
    );
  }

  Widget _createShoppingItem(ShoppingItem item) {
    return InkWell(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                item.category,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
