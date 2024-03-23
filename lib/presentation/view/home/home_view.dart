import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/presentation/widgets/categories_swiper.dart';
import 'package:books_app/presentation/widgets/my_library.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static String route = "/home";
  const HomeView({super.key});

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Stack(
        children: [
          MyLibrary(),
        ],
      ),
    );
  }
}
