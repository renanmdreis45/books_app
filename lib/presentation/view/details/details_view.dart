import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(5.0),
        child: Container(
          color: AppColors.mainDark,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  child: Image(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(img ?? ""),
              )),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title ?? "",
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        author ?? "",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.download,
                              color: AppColors.white,
                              size: 25,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star_border_rounded,
                              color: AppColors.white,
                              size: 25,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      date.split('-')[0],
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            description ?? "",
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                overflow: TextOverflow.clip),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 50,
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
