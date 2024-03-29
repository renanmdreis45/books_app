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
          // Expanded(
          //     child: Padding(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child:
          //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //     Text(author ?? "Autor desconhecido"),
          //     const SizedBox(
          //       height: 3,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(right: 10),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Expanded(
          //             child: Text(description ?? "Livro sem descrição"),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 6,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(right: 10),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text('${pageCount}'),
          //           const SizedBox(
          //             width: 3,
          //           ),
          //           Text(date ?? "Data Indisponível"),
          //         ],
          //       ),
          //     ),
          //   ]),
          // ))
        ]),
      ),
    );
  }
}
