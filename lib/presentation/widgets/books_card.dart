import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:books_app/presentation/view/details/details_view.dart';
import 'package:flutter/material.dart';

class BooksCard extends StatelessWidget {
  final String? id;
  final String? title;
  final String? author;
  final String? description;
  final String? img;
  final String date;
  final int pageCount;
  final String? downloadUrl;

  BooksCard(this.id, this.title, this.author, this.description, this.img,
      this.date, this.pageCount, this.downloadUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.shadowDark,
      child: Container(
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.all(2),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
        decoration: BoxDecoration(color: AppColors.shadowDark, borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
        child: InkWell(
          splashColor: AppColors.beige.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsView(id, title, author,
                      description, img, date, pageCount, downloadUrl)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 200,
              height: MediaQuery.of(context).size.height,
              child: Image(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(img ?? ""),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
