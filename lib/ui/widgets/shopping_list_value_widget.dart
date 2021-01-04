import 'package:flutter/material.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';

class ShoppingListValueWidget extends StatefulWidget {
  final ShoppingListValueItem item;
  final Function onDismiss;
  final Function onTap;

  ShoppingListValueWidget({@required this.item, @required this.onDismiss, @required this.onTap});

  @override
  _ShoppingListValueWidgetState createState() => _ShoppingListValueWidgetState();
}

class _ShoppingListValueWidgetState extends State<ShoppingListValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.item.name),
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
        widget.onDismiss.call();
      },
      child: InkWell(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(Spaces.space_4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
        onTap: () => widget.onTap.call(),
      ),
    );
  }
}
