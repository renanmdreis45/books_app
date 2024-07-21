import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_event.dart';
import 'package:books_app/presentation/widgets/all_books_swiper.dart';
import 'package:books_app/presentation/widgets/my_library.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static String route = "/home";
  const HomeView({super.key});

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  late BooksBloc _booksBloc;
  @override
  void initState() {
    super.initState();
    _booksBloc = BooksBloc();
    _booksBloc.add(GetBooks());
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          MyLibrary(),
          SizedBox(
            height: 60,
          ),
          AllBooksSwiper(),
        ],
      ),
    );
  }
}
