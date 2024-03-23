import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/i18n.dart';
import 'package:flutter/material.dart';

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
      height: 100,
      color: AppColors.mainDark,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          children: [
            Text(
              AppLanguage.labelMyLibrary,
              style: TextStyle(
                color: AppColors.beige,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.star,
              color: AppColors.beige,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
