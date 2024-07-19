import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/injection_container.dart';
import 'package:books_app/presentation/view/books/books_view.dart';
import 'package:books_app/presentation/view/favorites/favorites_view.dart';
import 'package:books_app/presentation/view/home/home_view.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BooksBloc>()..add(GetBooks()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.mainDark,
        ),
        routes: {
          '/home': (context) => const HomeView(),
          '/favorites': (context) => const FavoritesView(),
        },
        home: BooksView(
          initialIndex: 0,
        ),
      ),
    );
  }
}
