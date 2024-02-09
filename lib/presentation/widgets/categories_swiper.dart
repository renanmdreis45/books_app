import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/presentation/view_model/categories/categories_state.dart';
import 'package:books_app/presentation/view_model/bloc/categories/categories_bloc.dart'

class CategoriesSwiper extends StatefulWidget {
  const CategoriesSwiper({Key? key}) : super(key: key);

  @override
  State<CategoriesSwiper> createState() => _CategoriesSwiper();
}

class _CategoriesSwiper extends State<CategoriesSwiper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
      return _categoriesSwiper(state.categories,);
    });
  }

  Widget _categoriesSwiper(List<String> categories,) {
    return ListView.separated(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Center(
            child: Text(
              '${categories[index]}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border(
              left: BorderSide(
                  color: Colors.blueAccent,
                  width: 3,
              ),
            ),
          ),
      height: 20,
        );
      }, 
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 10,
      ));
  }
}
