import 'package:flutter/material.dart';

class BooksView extends StatefulWidget {
  static String route = "/books";
  const BooksView({super.key});

  @override
  _BooksView createState() => _BooksView();
}

class _BooksView extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Center(child:Text('Livros', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),)),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Text('Livros')
    );
  }
}
