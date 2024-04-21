import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
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
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
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
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 20,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 36,
          color: AppColors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Center(
        child: Text(
          AppLanguage.appBarTitle,
          style: TextStyle(
              color: AppColors.beige,
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: AppColors.mainDark,
    );
  }
}
