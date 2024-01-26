import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
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
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      title: const Center(
          child: Text(
        'Livros',
        style: TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
      )),
      backgroundColor: Colors.orangeAccent,
    );
  }

  _buildBody() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            BooksHeadline('Desconhecido', 'Livro bom', 'https://cdn.pixabay.com/photo/2018/09/11/19/22/harry-potter-3670411_1280.png', '25/01/2015', '5.0')
          ],
        ));
      },
    );
  }
}
