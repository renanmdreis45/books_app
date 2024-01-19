import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      // body: _buildBody(),
    );
  }

  _buildAppBar( ) {
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
            itemBuilder: (BuildContext context, int index) {
              return  Card(
                  child: Column(
                children: [
                  Image(
                          height: MediaQuery.of(context).size.height * 0.70,
                          width: 140,
                          image: const NetworkImage('https://cdn.pixabay.com/photo/2018/09/11/19/22/harry-potter-3670411_1280.png'),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Author: Desconhecido'),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Description: Livro muito bom'),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Date: 19/01/2024'),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Rating: 5'),
                ],
              ));
            },
          );
  }
}
