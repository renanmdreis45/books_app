import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
import 'package:books_app/presentation/widgets/all_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/presentation/widgets/book_headline.dart';

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
    return Scaffold(appBar: _buildAppBar(), body: Text("Oii"));
  }

  _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      title: const Center(
          child: Text(
        'Flutter Ebook App',
        style: TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
      )),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
