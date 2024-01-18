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
      body: _buildBody(),
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
    return BlocBuilder<BooksBloc, BookState>(
      builder: (_, state) {
        
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) {
              return  Card(
                  child: Column(
                children: [
                  state.books![index].coverUrl == ''
                      ? Container()
                      : Image(
                          height: MediaQuery.of(context).size.height * 0.70,
                          width: 140,
                          image: NetworkImage(state.books![index].coverUrl),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Author: ${state.books![index].author}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Description: ${state.books![index].description}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Date: ${state.books![index].date}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Rating: ${state.books![index].rating}'),
                ],
              ));
            },
          );
        
      },
    );
  }
}
