import 'dart:convert';

import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:http/http.dart' as http;

class BooksRepository {
  getAllBooks() async {
    String url = "https://escribo.com/books.json";

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      return BookResponse.fromJson(response.body);
    } catch (error) {
      print("Error fetching books");
      return BookResponse.showError(error as String);
    }
  }
}
