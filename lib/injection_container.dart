import 'package:books_app/data/repository/books_repository_impl.dart';
import 'package:books_app/data/sources/local/local_storage.dart';
import 'package:books_app/data/sources/remote/books_service.dart';
import 'package:books_app/domain/repository/books_repository.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/domain/usecase/get_favorite_books.dart';
import 'package:books_app/domain/usecase/add_favorite_book.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Local Storage
  sl.registerSingleton<LocalStorage>(LocalStorageImpl(sharedPreferences: sl()));

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Services
  sl.registerSingleton<BooksService>(BooksService(sl()));

  //Repositories
  sl.registerSingleton<BooksRepository>(BooksRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetAllBooks>(GetAllBooks(repository: sl()));

  sl.registerSingleton<GetFavoriteBooks>(GetFavoriteBooks(repository: sl()));

  sl.registerSingleton<SaveFavoriteBooks>(SaveFavoriteBooks(repository: sl()));

  //Bloc
  sl.registerFactory<BooksBloc>(
    () => BooksBloc(sl())
  );  
}
