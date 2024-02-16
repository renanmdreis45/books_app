import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:books_app/injection_container.dart';
import 'package:books_app/presentation/view/books/books_view.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BooksBloc(sl<GetAllBooks>()))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const BooksView(),
      ),
    );
  }
}
