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
  try {
    //Database
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    sl.registerLazySingleton<AppDatabase>(() => database);

    //Dio
    sl.registerLazySingleton<Dio>(() => Dio());

    //Service
    sl.registerSingleton<BooksService>(BooksService(sl()));

    //Repository
    sl.registerSingleton<BooksRepository>(BooksRepositoryImpl(sl(), sl()));

    //Use cases
    sl.registerSingleton<GetAllBooks>(GetAllBooks(repository: sl()));

    sl.registerSingleton<GetFavoriteBooks>(GetFavoriteBooks(repository: sl()));

    sl.registerSingleton<SaveFavoriteBooks>(
        SaveFavoriteBooks(repository: sl()));

    sl.registerSingleton<RemoveBook>(RemoveBook(repository: sl()));

    //Blocs
    sl.registerFactory<BooksBloc>(() => BooksBloc(
        getAllBooks: sl(),
        getFavoriteBooks: sl(),
        saveFavoriteBooks: sl(),
        removeBook: sl()));

  } catch (e, stacktrace) {
    print('Erro ao inicializar dependências: $e');
    print(stacktrace);
  }
}
