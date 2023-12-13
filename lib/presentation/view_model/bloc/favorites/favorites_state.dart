import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  final List<BookModel>? favorites;

  const FavoritesState({this.favorites});

  @override
  List<Object> get props => [favorites!];
}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

class FavoritesDone extends FavoritesState {
  const FavoritesDone(List<BookModel> favorites) : super(favorites: favorites);
}

