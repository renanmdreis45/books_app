import 'package:challenge_2_escribo/data/sources/remote/api.dart';
import 'package:challenge_2_escribo/domain/usecase/get_all_books.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:challenge_2_escribo/presentation/books/books_view.dart';
import 'package:challenge_2_escribo/presentation/books/books_view_model.dart';
import 'package:challenge_2_escribo/presentation/favorites/favorites_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: true,
          create: (BuildContext context) => BooksViewModel(
            getAllBooks: Provider.of<GetAllBooks>(context, listen: false),
            saveFavoriteBooks: Provider.of<SaveFavoriteBooks>(context, listen: false),
            getFavoriteBooks: Provider.of<GetFavoriteBooks>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (BuildContext context) => FavoritesViewModel(
            getAllBooks: Provider.of<GetAllBooks>(context, listen: false),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Challenge Escribo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: BooksView.route,
        routes: {
          BooksView.route: (context) => const BooksView(),
          FavoritesView.route: (context) => const FavoritesView(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == BooksView.route) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const BooksView(),
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.linear;
                var tween =
                    Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      
                return SlideTransition(
                    position: animation.drive(tween), child: child);
              },
            );
          }
      
          if (settings.name == FavoritesView.route) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const FavoritesView(),
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.linear;
                var tween =
                    Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      
                return SlideTransition(
                    position: animation.drive(tween), child: child);
              },
            );
          }
      
          return null;
        },
      ),
    );
  }
}
