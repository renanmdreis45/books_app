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
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 70,
        title: const Center(child:Text('Favoritos', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),)),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Text('Favoritos'),
    );
  }
}
