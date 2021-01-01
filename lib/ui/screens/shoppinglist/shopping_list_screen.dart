import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_list_header_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/ui/screens/shoppinglist/cubit/shopping_list_cubit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping_list/ui/widgets/loading.dart';
import 'package:shopping_list/ui/widgets/small_divider.dart';

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
        autofocus: false,
        onSubmitted: (value) {
          context
              .read<ShoppingListCubit>()
              .saveShoppingItem(ShoppingListValueItem(name: value));
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      suggestionsCallback: (input) async {
        return context.read<ShoppingListCubit>().getQuerySuggestions(input);
      },
      itemBuilder: (context, suggestion) {
        ShoppingListValueItem item = suggestion;
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.category),
        );
      },
      onSuggestionSelected: (suggestion) {
        context.read<ShoppingListCubit>().onSuggestionSelected(suggestion);
      },
    );
  }

  Widget _buildShoppingList(ShoppingList shoppingList, BuildContext context) {
    Map<Category, List<ShoppingListValueItem>> map = shoppingList.items;
    List<ShoppingListItem> list = List();
    map.forEach((key, value) {
      list.add(ShoppingListHeaderItem(category: key));
      value.forEach((element) {
        list.add(element);
      });
    });
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ShoppingListItem item = list[index];
          if (item is ShoppingListHeaderItem) {
            return _buildShoppingListHeaderItem(item);
          } else {
            return _buildShoppingListValueItem(item, context);
          }
        },
        separatorBuilder: (context, index) => SmallDivider(),
        itemCount: list.length,
      ),
    );
  }

  Widget _buildShoppingListValueItem(ShoppingListValueItem item, BuildContext context) {
    return Dismissible(
      key: Key(item.name),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spaces.space_4),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        context.read<ShoppingListCubit>().deleteShoppingItem(item);
      },
      child: InkWell(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(Spaces.space_4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
        onTap: () => Routes.openShoppingItemDetails(context, item),
      ),
    );
  }

  Widget _buildShoppingListHeaderItem(ShoppingListHeaderItem item) {
    return InkWell(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(Spaces.space_4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.category.name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
