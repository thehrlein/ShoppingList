import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/ui/screens/categories/cubit/categories_cubit.dart';
import 'package:shopping_list/ui/widgets/loading.dart';
import 'package:shopping_list/ui/widgets/small_divider.dart';

class CategoriesScreen extends StatefulWidget {
  final categoriesCubit = GetIt.instance.get<CategoriesCubit>();

  @override
  State createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _addCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      cubit: widget.categoriesCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).categoriesTitle),
          ),
          body: RefreshIndicator(
            child: state.when(
              loading: () => SimpleLoadingIndicator(),
              loaded: _showCategories,
            ),
            onRefresh: () => widget.categoriesCubit.refreshCategories(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _onFabClicked(context),
            tooltip: S.of(context).menuListFabTooltip,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _showCategories(List<Category> categories) {
    return ListView.separated(
      itemBuilder: (context, index) {
        Category item = categories[index];
        return _createCategoryItem(item);
      },
      separatorBuilder: (context, index) => SmallDivider(),
      itemCount: categories.length,
    );
  }

  Widget _createCategoryItem(Category item) {
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
        _deleteCategory(item);
      },
      child: Padding(
        padding: const EdgeInsets.all(Spaces.space_4),
        child: InkWell(
          child: Container(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () => _onDeleteClicked(item),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onFabClicked(BuildContext context) {
    showDialog(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(Spaces.space_4),
        content: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _addCategoryController,
                decoration: InputDecoration(
                  labelText: S.of(context).categoriesAddDialogTitle,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text(S.of(context).categoriesAddDialogButtonCancel),
            onPressed: () {
              Routes.pop(context);
            },
          ),
          TextButton(
            child: Text(S.of(context).categoriesAddDialogButtonSave),
            style: TextButton.styleFrom(primary: Theme.of(context).accentColor),
            onPressed: () => _saveCategory(context),
          )
        ],
      ),
    );
  }

  void _saveCategory(BuildContext context) {
    String name = _addCategoryController.text;
    if (name.isNotEmpty) {
      Category category = Category(name: name);
      widget.categoriesCubit
          .saveCategory(category)
          .then((value) => Routes.pop(context));
    }
  }

  void _onDeleteClicked(Category category) {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text(S.of(context).categoriesDeleteDialogTitle),
          actions: [
            TextButton(
              child: Text(S.of(context).categoriesDeleteDialogButtonCancel),
              onPressed: () {
                Routes.pop(context);
              },
            ),
            TextButton(
              child: Text(S.of(context).categoriesDeleteDialogButtonDelete),
              style:
                  TextButton.styleFrom(primary: Theme.of(context).accentColor),
              onPressed: () => _deleteCategory(category)
                  .then((value) => Routes.pop(context)),
            )
          ],
        ));
  }

  Future<void> _deleteCategory(Category category) {
    return widget.categoriesCubit.deleteCategory(category);
  }
}
