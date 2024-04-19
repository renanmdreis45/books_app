import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String? title;
  final String? author;
  final String? description;
  final String? img;
  final String date;

  DetailsView(this.title, this.author, this.description, this.img, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainDark,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(img ?? ""),
              ))
        ],
      ),
    );
  }
}
