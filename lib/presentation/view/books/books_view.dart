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
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const AllBooksWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.mainDark,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: AppLanguage.bottomNavigationBarLabelHome),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 25,
              ),
              label: AppLanguage.bottomNavigationBarLabelFavorites)
        ],
        selectedItemColor: AppColors.beige,
        unselectedItemColor: AppColors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
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
