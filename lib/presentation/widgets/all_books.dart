import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
import 'package:books_app/presentation/widgets/all_books_sucess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AllBooksWidget extends StatelessWidget {
  const AllBooksWidget({
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
        }
        return const SizedBox();
      },
    );
  }
}
