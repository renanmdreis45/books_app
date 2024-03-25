import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:books_app/presentation/view/books/books_view.dart';
import 'package:books_app/presentation/view/favorites/favorites_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({Key? key}) : super(key: key);

  @override
  State<MyLibrary> createState() => _MyLibrary();
}

class _MyLibrary extends State<MyLibrary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: AppColors.mainDark,
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Center(
          child: Column(
            children: [
              const Text(
                AppLanguage.labelMyLibrary,
                style: TextStyle(
                  color: AppColors.beige,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BooksView(
                      initialIndex: 1,
                    );
                  }));
                },
                child: const Expanded(
                  child: Card(
                    color: AppColors.secondaryDark,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Column(children: [
                        Text(
                          AppLanguage.labelMyFavorites,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.beige,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.beige,
                          size: 40,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
