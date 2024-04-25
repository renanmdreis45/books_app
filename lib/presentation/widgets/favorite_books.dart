import 'package:books_app/presentation/view_model/bloc/favorites/favorites_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/favorites/favorites_state.dart';
import 'package:books_app/presentation/widgets/all_books_sucess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBooks extends StatelessWidget {
  const FavoriteBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesDone) {
          return AllBooksSuccessWidget(books: state.favorites ?? []);
        }

        return const SizedBox();
      },
    );
  }
}
