import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:books_app/presentation/widgets/all_books.dart';
import 'package:flutter/material.dart';

class BooksView extends StatefulWidget {
  static String route = "/books";

  const BooksView({Key? key}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksView();
}

class _BooksView extends State<BooksView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: const AllBooksWidget());
  }

  _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      title: const Center(
          child: Text(
        AppLanguage.appBarTitle,
        style: TextStyle(
            color: AppColors.beige, fontSize: 28, fontWeight: FontWeight.w700),
      )),
      backgroundColor: AppColors.mainDark,
    );
  }
}
