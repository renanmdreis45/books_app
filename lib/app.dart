import 'package:challenge_2_escribo/presentation/books/books_view.dart';
import 'package:challenge_2_escribo/presentation/favorites/favorites_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
