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
                      booksCurrent.author,
                      booksCurrent.description,
                      booksCurrent.img,
                      booksCurrent.date,
                      booksCurrent.pageCount);
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
