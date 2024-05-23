import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:books_app/presentation/view/details/details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksHeadline extends StatelessWidget {
  final String? id;
  final String? title;
  final String? author;
  final String? description;
  final String? img;
  final String date;
  final int pageCount;
  final String? downloadUrl;

  BooksHeadline(
      this.id, this.title, this.author, this.description, this.img, this.date, this.pageCount, this.downloadUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      color: AppColors.shadowDark,
      elevation: 10,
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
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Image(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  image: NetworkImage(img ?? ""),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title ?? "",
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                color: AppColors.shadowDark,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    date.isNotEmpty
                        ? date.split('-')[0]
                        : AppLanguage.undefinedDate,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
