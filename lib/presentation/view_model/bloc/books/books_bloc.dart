import 'package:challenge_2_escribo/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_2_escribo/domain/usecase/get_all_books.dart';
import 'package:challenge_2_escribo/presentation/view_model/bloc/books/books_event.dart';
import 'package:challenge_2_escribo/presentation/view_model/bloc/books/books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BookState> {
  final GetAllBooks _getAllBooks;

  BooksBloc(this._getAllBooks) : super(const BooksLoading()) {
    on<GetBooks>(onGetBooks);
  }

  void onGetBooks(GetBooks event, Emitter<BookState> emit) async {
    final dataState = await _getAllBooks();

    if(dataState is DataSucess && dataState.data!.isNotEmpty) {
      
    }
  }
}
