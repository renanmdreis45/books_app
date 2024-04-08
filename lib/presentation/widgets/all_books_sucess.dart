import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/presentation/widgets/book_headline.dart';
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
      child: Container(
        color: AppColors.mainDark,
        width: 100,
        height:
            ((100 * books.length) + MediaQuery.of(context).size.width) + 24.0,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  BookModel booksCurrent = books[index];
                  return BooksHeadline(
                      booksCurrent.title,
                      booksCurrent.author,
                      booksCurrent.description,
                      booksCurrent.img,
                      booksCurrent.date);
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
