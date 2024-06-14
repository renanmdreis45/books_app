import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/presentation/widgets/book_headline.dart';
import 'package:books_app/presentation/widgets/books_card.dart';
import 'package:flutter/material.dart';

class AllBooksSuccessWidget extends StatelessWidget {
  const AllBooksSuccessWidget({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          color: AppColors.mainDark,
          width: 100,
          height: double.maxFinite,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: books.length,
            itemBuilder: (context, index) {
              BookModel booksCurrent = books[index];

              return BooksCard(
                  booksCurrent.id,
                  booksCurrent.title,
                  booksCurrent.author,
                  booksCurrent.description,
                  booksCurrent.img,
                  booksCurrent.date,
                  booksCurrent.pageCount,
                  booksCurrent.downloadUrl);
            },
          ),
        ));
  }
}
