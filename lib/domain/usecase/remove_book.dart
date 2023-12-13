import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class RemoveBook {
  final BooksRepository _booksRepository;

  RemoveBook(this._booksRepository);

  @override
  Future<void> call({BookModel ? book}) {
    
  }
}
