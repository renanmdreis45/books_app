import 'package:books_app/presentation/widgets/categories_swiper.dart';
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
    return const Column(
      children: [
        CategoriesSwiper()
      ],
    );
  }
}
