import 'package:shopping_list/app/utils/constants.dart';

enum ShoppingItemEditType { ACTIVE, ALL }

extension ShoppingItemEditTypeExt on ShoppingItemEditType {
  String getDocument() {
    switch (this) {
      case ShoppingItemEditType.ACTIVE:
        return Constants.DOCUMENT_ACTIVE;
      case ShoppingItemEditType.ALL:
      default:
        return Constants.DOCUMENT_ALL;
    }
  }
}
