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
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Center(
            child: Text(
          'Livros',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
        )),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<BooksBloc, BookState>(
      builder: (_, state) {
        if (state is BooksLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is BooksError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }

        if (state is BooksDone) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) {
              return Card(
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
                  Text(state.books![index].title),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(state.books![index].author)
                ],
              ));
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
