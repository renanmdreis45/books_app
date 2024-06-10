import 'package:books_app/data/repository/books_repository_impl.dart';
import 'package:books_app/data/sources/local/app_database.dart';
import 'package:books_app/data/sources/remote/books_service.dart';
import 'package:books_app/domain/repository/books_repository.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/domain/usecase/get_favorite_books.dart';
import 'package:books_app/domain/usecase/add_favorite_book.dart';
import 'package:books_app/domain/usecase/remove_book.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Service
  sl.registerSingleton<BooksService>(BooksService(sl()));

  //Repository
  sl.registerSingleton<BooksRepository>(BooksRepositoryImpl(sl(), sl()));

  //Blocs
  sl.registerFactory<BooksBloc>(() => BooksBloc(sl(), sl()));

  //Use cases
  sl.registerLazySingleton<GetAllBooks>(() => GetAllBooks(repository: sl()));

  sl.registerLazySingleton<GetFavoriteBooks>(
      () => GetFavoriteBooks(repository: sl()));

  sl.registerLazySingleton<SaveFavoriteBooks>(
      () => SaveFavoriteBooks(repository: sl()));

  sl.registerLazySingleton<RemoveBook>(() => RemoveBook(repository: sl()));
}
