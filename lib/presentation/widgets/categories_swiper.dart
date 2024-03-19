import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/presentation/view_model/bloc/categories/categories_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      return _categoriesSwiper(
        state.categories,
      );
    });
  }

  Widget _categoriesSwiper(
    List<String> categories,
  ) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
              image: AssetImage("assets/fiction.png"),
            fit: BoxFit.cover)),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 10,
            ));
  }
}
