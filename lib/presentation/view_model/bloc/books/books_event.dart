abstract class BooksEvent {
  const BooksEvent();
}

class GetBooks extends BooksEvent {
  const GetBooks();
}

class GetFavorites extends BooksEvent {
  const GetFavorites();
}
