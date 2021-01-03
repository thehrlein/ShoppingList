import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';

class ShoppingItemEditModel {
  final ShoppingListValueItem shoppingItem;
  final ShoppingItemEditType itemType;

  ShoppingItemEditModel(this.shoppingItem, this.itemType);

  @override
  String toString() {
    return 'ShoppingItemEditModel{ShoppingListValueItem: $ShoppingListValueItem, ShoppingItemEditType: $ShoppingItemEditType}';
  }
}