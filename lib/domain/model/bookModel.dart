import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  int id;
  String title;
  String author;
  String description;
  String coverUrl;
  String date;
  int rating;
  String downloadUrl;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.coverUrl,
    required this.date,
    required this.rating,
    required this.downloadUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["volumeInfo"]["title"],
        author: json["volumeInfo"]["authors"][0],
        description: json["description"],
        coverUrl: json["imageLinks"]["thumbnail"],
        date: json["publishedDate"],
        rating: json["averageRating"],
        downloadUrl: json["download_url"],
      );
}
