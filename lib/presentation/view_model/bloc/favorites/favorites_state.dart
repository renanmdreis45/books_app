import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  final List<BookModel>? favorites;

  const FavoritesState({this.favorites});

  @override
  List<Object> get props => [favorites!];
}

class FavoritesDone
