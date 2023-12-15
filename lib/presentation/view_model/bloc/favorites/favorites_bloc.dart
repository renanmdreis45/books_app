import 'package:books_app/domain/usecase/add_favorite_book.dart';
import 'package:books_app/domain/usecase/get_favorite_books.dart';
import 'package:books_app/domain/usecase/remove_book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/favorites/favorites_event.dart';
import 'package:books_app/presentation/view_model/bloc/favorites/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteBooks _getFavoriteBooks;
  final SaveFavoriteBooks _saveFavoriteBooks;
  final RemoveBook _removeBook;

  FavoritesBloc(
      this._getFavoriteBooks, this._saveFavoriteBooks, this._removeBook)
      : super(const FavoritesLoading()) {
    on<GetFavorites>(onGetFavoriteBooks);
    on<RemoveFavorite>(onRemoveBook);
    on<AddBook>(onAddBook);
  }

  void onGetFavoriteBooks(
      GetFavorites event, Emitter<FavoritesState> emit) async {
    final books = await _getFavoriteBooks();
    emit(FavoritesDone(books));
  }

  void onRemoveBook(
      RemoveFavorite removeBook, Emitter<FavoritesState> emit) async {
    await _removeBook(book: removeBook.book!);
    final books = await _getFavoriteBooks();
    emit(FavoritesDone(books));
  }

  void onAddBook(AddBook addBook, Emitter<FavoritesState> emit) async {
    await _saveFavoriteBooks(book: addBook.book!);
    final books = await _getFavoriteBooks();
    emit(FavoritesDone(books));
  }
}
