import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/usecase/add_favorite_book.dart';
import 'package:books_app/domain/usecase/get_favorite_books.dart';
import 'package:books_app/domain/usecase/remove_book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_event.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BookState> {
  final GetAllBooks? _getAllBooks;
  final GetFavoriteBooks? _getFavoriteBooks;
  final SaveFavoriteBooks? _saveFavoriteBooks;
  final RemoveBook? _removeBook;

  BooksBloc(
      {GetAllBooks? getAllBooks,
      GetFavoriteBooks? getFavoriteBooks,
      SaveFavoriteBooks? saveFavoriteBooks,
      RemoveBook? removeBook})
      : _getAllBooks = getAllBooks,
        _getFavoriteBooks = getFavoriteBooks,
        _saveFavoriteBooks = saveFavoriteBooks,
        _removeBook = removeBook,
        super(const BooksLoading()) {
    on<GetBooks>(onGetBooks);
    on<GetFavorites>(onGetFavoriteBooks);
    on<AddFavorites>(onAddFavoriteBooks);
    on<RemoveFavorites>(onRemoveFromFavorites);
  }

  void onGetBooks(GetBooks event, Emitter<BookState> emit) async {
    final dataState = await _getAllBooks!.call();

    if (dataState is DataSucess && dataState.data!.isNotEmpty) {
      emit(BooksDone(dataState.data!));
    }

    if (dataState is DataError) {
      emit(BooksError(dataState.error!));
    }
  }

  void onGetFavoriteBooks(GetFavorites event, Emitter<BookState> emit) async {
    final dataState = await _getFavoriteBooks!.call();

    if (dataState.isNotEmpty) {
      emit(FavoritesDone(dataState));
    }
  }

  void onAddFavoriteBooks(AddFavorites event, Emitter<BookState> emit) async {
    try {
      await _saveFavoriteBooks!(book: event.newFavoriteBook!);
      emit(AddFavoritesSuccess(
          'O livro ${event.newFavoriteBook!.title} foi adicionado aos favoritos'));
    } catch (e) {
      emit(AddFavoritesError(e));
    }
  }

  void onRemoveFromFavorites(
      RemoveFavorites event, Emitter<BookState> emit) async {
    try {
      await _removeBook!(book: event.removeBook!);
      emit(RemoveFavoritesSucess(
          'O livro "${event.removeBook!.title}" foi removido dos favoritos'));
    } catch (e) {
      emit(RemoveFavoritesError(e));
    }
  }
}
