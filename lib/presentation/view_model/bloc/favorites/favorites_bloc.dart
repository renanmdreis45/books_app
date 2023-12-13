import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/favorites/favorites_event.dart';
import 'package:books_app/presentation/view_model/bloc/favorites/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteBooks _getFavoriteBooks;
  final AddBook _addBook;
  final RemoveBook _removeBook;

  FavoritesBloc(this._getFavoriteBooks, this._addBook, this._removeBook)
      : super(const FavoritesLoading()) {
    on<GetFavoriteBooks>(onGetFavoriteBooks);
    on<RemoveBook>(onRemoveBook);
    on<AddBook>(onAddBook);
  }

  void onGetFavoriteBooks(
      GetFavoriteBooks event, Emitter<FavoritesState> emit) async {
    final books = await _getFavoriteBooks();
    emit(FavoritesDone(books));
  }

  void onRemoveBook(RemoveBook removeBook, Emitter<FavoritesState> emit) async {
    
  }

  void onAddBook() {}
}
