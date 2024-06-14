import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/domain/model/bookModel.dart';
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
          width: 500,
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 1),
                delegate: SliverChildListDelegate(
                    List.generate(books.length, (index) {
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
                })),
              )
            ],
          ),
        ));
  }
}
