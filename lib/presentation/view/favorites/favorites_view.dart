import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_event.dart';
import 'package:books_app/presentation/widgets/favorite_books.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  static String route = "/favorites";
  const FavoritesView({super.key});

  @override
  _FavoritesView createState() => _FavoritesView();
}

class _FavoritesView extends State<FavoritesView> {
  late BooksBloc _booksBloc;

  @override
  void initState() {
    super.initState();
    _booksBloc = BooksBloc();
    _booksBloc.add(GetFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      child: const FavoriteBooks(),
    );
  }
}
