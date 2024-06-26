import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:books_app/presentation/view/favorites/favorites_view.dart';
import 'package:books_app/presentation/view/home/home_view.dart';
import 'package:books_app/presentation/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class BooksView extends StatefulWidget {
  static String route = "/books";
  final int initialIndex;

  BooksView({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksView();
}

class _BooksView extends State<BooksView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialIndex == 1) {
      setState(() {
        _selectedIndex = 1;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [
    const HomeView(),
    const FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: screens[_selectedIndex],
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
      leadingWidth: 20,
      actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              size: 36,
              color: AppColors.white,
            ))
      ],
      title: Transform(
        transform: Matrix4.translationValues(20.0, 0.0, 0.0),
        child: const Center(
            child: Text(
          AppLanguage.appBarTitle,
          style: TextStyle(
              color: AppColors.beige,
              fontSize: 28,
              fontWeight: FontWeight.w700),
        )),
      ),
      backgroundColor: AppColors.mainDark,
    );
  }
}
