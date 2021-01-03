import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_model.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/models/shopping/shopping_list_header_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';
import 'package:shopping_list/ui/screens/categories/cubit/categories_cubit.dart';
import 'package:shopping_list/ui/screens/editshoppingitems/cubit/edit_shopping_items_cubit.dart';
import 'package:shopping_list/ui/widgets/loading.dart';
import 'package:shopping_list/ui/widgets/shopping_list_header_widget.dart';
import 'package:shopping_list/ui/widgets/shopping_list_value_widget.dart';
import 'package:shopping_list/ui/widgets/small_divider.dart';

class EditShoppingItemsScreen extends StatefulWidget {
  final editShoppingItemsCubit = GetIt.instance.get<EditShoppingItemsCubit>();

  @override
  _EditShoppingItemsScreenState createState() =>
      _EditShoppingItemsScreenState();
}

class _EditShoppingItemsScreenState extends State<EditShoppingItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditShoppingItemsCubit, EditShoppingItemsState>(
      cubit: widget.editShoppingItemsCubit,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            widget.editShoppingItemsCubit.close();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).shoppingItemsTitle),
            ),
            body: RefreshIndicator(
              child: state.when(
                loading: () => SimpleLoadingIndicator(),
                loaded: (shoppingList) => _buildShoppingList(shoppingList),
              ),
              onRefresh: () => widget.editShoppingItemsCubit.refreshShoppingList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShoppingList(ShoppingList shoppingList) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        ShoppingListItem item = shoppingList.items[index];
        if (item is ShoppingListHeaderItem) {
          return ShoppingListHeaderWidget(item: item);
        } else {
          return ShoppingListValueWidget(
            item: item,
            onDismiss: () =>
                widget.editShoppingItemsCubit.deleteShoppingItem(item),
            onTap: () => Routes.openShoppingItemDetails(context, ShoppingItemEditModel(item, ShoppingItemEditType.ALL)),
          );
        }
      },
      separatorBuilder: (context, index) => SmallDivider(),
      itemCount: shoppingList.items.length,
    );
  }
}
