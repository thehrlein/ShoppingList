import 'package:flutter/material.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/shopping/shopping_list_header_item.dart';

class ShoppingListHeaderWidget extends StatefulWidget {
  final ShoppingListHeaderItem item;

  ShoppingListHeaderWidget({@required this.item});

  @override
  _ShoppingListHeaderWidgetState createState() =>
      _ShoppingListHeaderWidgetState();
}

class _ShoppingListHeaderWidgetState extends State<ShoppingListHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            Spaces.space_0, Spaces.space_4, Spaces.space_0, Spaces.space_0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.item.category.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Theme.of(context).textTheme.caption.color),
            ),
          ],
        ),
      ),
    );
  }
}
