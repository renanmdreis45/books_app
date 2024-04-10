import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_bloc.dart';
import 'package:books_app/presentation/view_model/bloc/books/books_state.dart';
import 'package:books_app/presentation/widgets/book_headline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksSwiper extends StatefulWidget {
  const AllBooksSwiper({Key? key}) : super(key: key);

  @override
  State<AllBooksSwiper> createState() => _BooksSwiper();
}

class _BooksSwiper extends State<AllBooksSwiper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BookState>(builder: (context, state) {
      if (state is BooksDone) {
        return _booksSwiper(
          state.books ?? [],
        );
      }
      return const SizedBox();
    });
  }

  Widget _booksSwiper(
    List<BookModel> books,
  ) {
    return Container(
      color: AppColors.mainDark,
      height: 240,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          AppLanguage.allBooksSwiperHeader,
          style: TextStyle(color: AppColors.beige, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return BooksHeadline(
                    books[index].title,
                    books[index].author,
                    books[index].description,
                    books[index].img,
                    books[index].date);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    width: 10,
                  )),
        ),
      ]),
    );
  }
}
