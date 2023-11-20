import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  int id;
  String title;
  String author;
  String coverUrl;
  String downloadUrl;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        coverUrl: json["cover_url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "cover_url": coverUrl,
        "download_url": downloadUrl,
      };
}

class BookResponse {
  final List<BookModel> books;
  final String error;

  BookResponse(this.books, this.error);

  BookResponse.fromJson(String jsonString)
      : books = (json.decode(jsonString) as List)
            .map((e) => BookModel.fromJson(e))
            .toList(),
        error = "";

  BookResponse.showError(String errorValue)
      : books = [],
        error = errorValue;
}
