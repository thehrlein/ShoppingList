import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_model.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_header_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/ui/screens/shoppinglist/cubit/shopping_list_cubit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping_list/ui/widgets/loading.dart';
import 'package:shopping_list/ui/widgets/shopping_list_header_widget.dart';
import 'package:shopping_list/ui/widgets/shopping_list_value_widget.dart';
import 'package:shopping_list/ui/widgets/small_divider.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  TextEditingController _searchInputController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

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
                  loading: () => SimpleLoadingIndicator(),
                  loaded: (list) => Column(
                    children: [
                      _buildSearchField(context),
                      _buildShoppingList(list, context)
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

  TypeAheadField<ShoppingListValueItem> _buildSearchField(
      BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        focusNode: searchFocusNode,
        autofocus: false,
        textInputAction: TextInputAction.go,
        controller: _searchInputController,
        onSubmitted: (value) {
          context
              .read<ShoppingListCubit>()
              .saveShoppingItem(ShoppingListValueItem(name: value))
              .then((value) {
                _searchInputController
                    ..text = "";
                searchFocusNode.requestFocus();
              });
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => _searchInputController.text = "",
          ),
          border: OutlineInputBorder(),
        ),
      ),
      suggestionsCallback: (input) async {
        return context.read<ShoppingListCubit>().getQuerySuggestions(input);
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      noItemsFoundBuilder: (context) => SizedBox.shrink(),
      itemBuilder: (context, suggestion) {
        ShoppingListValueItem item = suggestion;
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.category),
        );
      },
      hideOnEmpty: true,
      hideOnLoading: false,
      keepSuggestionsOnLoading: true,
      onSuggestionSelected: (suggestion) {
        context.read<ShoppingListCubit>().onSuggestionSelected(suggestion);
      },
    );
  }

  Widget _buildShoppingList(ShoppingList shoppingList, BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ShoppingListItem item = shoppingList.items[index];
          if (item is ShoppingListHeaderItem) {
            return ShoppingListHeaderWidget(item: item);
          } else {
            return ShoppingListValueWidget(
              item: item,
              onDismiss: () =>
                  context.read<ShoppingListCubit>().deleteShoppingItem(item),
              onTap: () => Routes.openShoppingItemDetails(context,
                  ShoppingItemEditModel(item, ShoppingItemEditType.ACTIVE)),
            );
          }
        },
        separatorBuilder: (context, index) => SmallDivider(),
        itemCount: shoppingList.items.length,
      ),
    );
  }
}
