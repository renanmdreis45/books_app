import 'package:flutter/material.dart';

class BooksHeadline extends StatelessWidget {
  final String author;
  final String description;
  final String img;
  final String date;
  final String rating;

  BooksHeadline(
      this.author, this.description, this.img, this.date, this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(children: [
                            Image(
                          height: MediaQuery.of(context).size.height * 0.70,
                          width: 140,
                          image: NetworkImage(img),
                        ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                 const Text('Author: Desconhecido'),

              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(description),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
                            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(rating),
                    const SizedBox(width: 3,),
                    Text(date),
                  ],
                ),
              ),
            ]),
          ))
        ]),
      ),
    );
  }
}