import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BooksHeadline extends StatelessWidget {
  final String? title;
  final String? author;
  final String? description;
  final String? img;
  final String date;

  BooksHeadline(
      this.title, this.author, this.description, this.img, this.date);

  @override
  Widget build(BuildContext context) {                                
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      color: AppColors.shadowDark,
      elevation: 5,
      child: Column(children: [
        Image(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width,
          image: NetworkImage(img ?? ""),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title ?? "",
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
            )),
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          color: AppColors.shadowDark,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              date.isNotEmpty ? date.split('-')[0] : "Undefined Date",
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
