import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksSwiper extends StatefulWidget {
  const BooksSwiper({Key? key}) : super(key: key);

  @override
  State<BooksSwiper> createState() => _BooksSwiper();
}

class _BooksSwiper extends State<BooksSwiper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BookState>(builder: (_, state) {
      return _booksSwiper(
        state.books!,
      );
    });
  }

  Widget _booksSwiper(
    List<BookModel> books,
  ) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Image(
              height: MediaQuery.of(context).size.height * 0.70,
              width: 140,
              image: NetworkImage(books[index].img));
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 10,
            ));
  }
}
