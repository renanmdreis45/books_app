import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
import 'package:books_app/presentation/widgets/all_books_sucess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooks extends StatelessWidget {
  const AllBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BookState>(
      builder: (context, state) {
        if (state is BooksDone) {
          return AllBooksSuccessWidget(
            books: state.books ?? [],
          );
        } else if (state is BooksLoading) {
          return const CircularProgressIndicator();
        }
        return const SizedBox();
      },
    );
  }
}
