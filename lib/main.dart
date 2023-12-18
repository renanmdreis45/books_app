import 'package:books_app/presentation/view/books/books_view.dart';
import 'package:books_app/presentation/view/favorites/favorites_view.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_event.dart';
import 'package:flutter/material.dart';
import 'package:books_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BooksBloc>(
      create: (context) => sl()..add(const GetBooks()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books App',
        theme: ThemeData(
          useMaterial3: true,
        ),
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
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

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
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                    position: animation.drive(tween), child: child);
              },
            );
          }

          return null;
        },
        home: const BooksView(),
      ),
    );
  }
}
