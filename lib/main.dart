import 'package:challenge_2_escribo/app.dart';
import 'package:challenge_2_escribo/data/repository/books_repository_impl.dart';
import 'package:challenge_2_escribo/data/repository/favorites_repository_impl.dart';
import 'package:challenge_2_escribo/data/sources/local/local_storage.dart';
import 'package:challenge_2_escribo/data/sources/remote/api.dart';
import 'package:challenge_2_escribo/domain/usecase/get_all_books.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:challenge_2_escribo/presentation/books/books_view_model.dart';
import 'package:challenge_2_escribo/presentation/favorites/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => BooksRepositoryImpl(api: Provider.of<ApiImpl>(_, listen: false))),
        Provider(create: (_) => FavoritesRepositoryImpl(localStorage: Provider.of<LocalStorageImpl>(_, listen: false))),
        Provider(create: (_) => GetAllBooks(repository: Provider.of<BooksRepositoryImpl>(_, listen: false))),
        Provider(create: (_) => SaveFavoriteBooks(repository: Provider.of<FavoritesRepositoryImpl>(_, listen: false))),
        Provider(create: (_) => GetFavoriteBooks(repository: Provider.of<FavoritesRepositoryImpl>(_, listen: false))),
        ChangeNotifierProvider(
          lazy: true,
          create: (BuildContext context) => BooksViewModel(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (BuildContext context) => FavoritesViewModel(),
        )
      ],
      child: const App(),
    );
  }
}
