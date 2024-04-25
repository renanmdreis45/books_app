import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  static String route = "/favorites";
  const FavoritesView({super.key});

  @override
  _FavoritesView createState() => _FavoritesView();
}

class _FavoritesView extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(itemBuilder: (context, index) {
        return
      }),
    );
  }
}
