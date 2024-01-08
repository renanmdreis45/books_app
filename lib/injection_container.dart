import 'package:books_app/data/repository/books_repository_impl.dart';
import 'package:books_app/data/sources/local/app_database.dart';
import 'package:books_app/data/sources/remote/books_service.dart';
import 'package:books_app/domain/repository/books_repository.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/domain/usecase/get_favorite_books.dart';
import 'package:books_app/domain/usecase/add_favorite_book.dart';
import 'package:books_app/domain/usecase/remove_book.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/favorites/favorites_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  //Books
  sl..registerFactory<BooksBloc>(() => BooksBloc(sl()))
    ..registerLazySingleton<GetAllBooks>(() => GetAllBooks(repository: sl()))
      ..registerSingleton<BooksRepository>(BooksRepositoryImpl(sl(), sl()))
        ..registerSingleton<BooksService>(BooksService(sl()))..registerSingleton<Dio>(Dio());

  //Favorites
  sl..registerFactory<FavoritesBloc>(() => FavoritesBloc(sl(), sl(), sl()))..registerLazySingleton<GetFavoriteBooks>(
      () => GetFavoriteBooks(repository: sl()))
        ..registerLazySingleton<SaveFavoriteBooks>(() => SaveFavoriteBooks(repository: sl()))
          ..registerLazySingleton<RemoveBook>(() => RemoveBook(repository: sl()))
            ..registerSingleton<BooksRepository>(BooksRepositoryImpl(sl(), sl()))
                ..registerSingleton<AppDatabase>(database);
}
