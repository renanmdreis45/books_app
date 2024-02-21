import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  String id;
  String title;
  String author;
  String description;
  String img;
  String date;
  int pageCount;
  String downloadUrl;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.img,
    required this.date,
    required this.pageCount,
    required this.downloadUrl,
  });

  String toRawJson() => json.encode(toJson());

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["volumeInfo"]["title"],
        author: json["volumeInfo"]["authors"][0],
        description: json["volumeInfo"]["description"],
        img: json["volumeInfo"]["imageLinks"]["thumbnail"],
        date: json["volumeInfo"]["publishedDate"],
        pageCount: json["volumeInfo"]["pageCount"] ?? 0,
        downloadUrl: json["accessInfo"]["epub"]["acsTokenLink"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "img": img,
        "date": date,
        "pageCount": pageCount,
        "downloadUrl": downloadUrl,
      };
}
