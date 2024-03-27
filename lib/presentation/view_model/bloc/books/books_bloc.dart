import 'package:books_app/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_event.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BookState> {
  final GetAllBooks _getAllBooks;

  BooksBloc(this._getAllBooks) : super(const BooksLoading()) {
    on<GetBooks>(onGetBooks);
  }

  void onGetBooks(GetBooks event, Emitter<BookState> emit) async {
    final dataState = await _getAllBooks.call();
    

    if (dataState is DataSucess && dataState.data!.isNotEmpty) {
      emit(BooksDone(dataState.data!));
    }

    if (dataState is DataError) {
      emit(BooksError(dataState.error!));
    }
  }
}
