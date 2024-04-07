import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BooksHeadline extends StatelessWidget {
  final String? author;
  final String? description;
  final String? img;
  final String? date;
  final int? pageCount;

  BooksHeadline(
      this.author, this.description, this.img, this.date, this.pageCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      color: AppColors.shadowDark,
      child: Card(
        elevation: 5,
        child: Column(children: [
          Image(
            height: MediaQuery.of(context).size.height * 0.70,
            width: 140,
            image: NetworkImage(img ?? ""),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                date ?? "",
                style: TextStyle(
                  color: AppColors.beige,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
