
part of 'app_database.dart';


class $FloorAppDatabase {
  
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookDao? _bookDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `book` (`id` TEXT, `author` TEXT, `title` TEXT, `description` TEXT, `img` TEXT, `date` TEXT, `pageCount` INTEGER, `downloadUrl` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookDao get bookDao {
    return _bookDAOInstance ??= _$BookDao(database, changeListener);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _bookModelInsertionAdapter = InsertionAdapter(
            database,
            'book',
            (BookModel item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'img': item.img,
                  'date': item.date,
                  'pageCount': item.pageCount,
                  'downloadUrl': item.downloadUrl
                }),
        _bookModelDeletionAdapter = DeletionAdapter(
            database,
            'book',
            ['id'],
            (BookModel item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'img': item.img,
                  'date': item.date,
                  'pageCount': item.pageCount,
                  'downloadUrl': item.downloadUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookModel> _bookModelInsertionAdapter;

  final DeletionAdapter<BookModel> _bookModelDeletionAdapter;

  @override
  Future<List<BookModel>> getFavoriteBooks() async {
    return _queryAdapter.queryList('SELECT * FROM book',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as String,
            author: row['author'] as String,
            title: row['title'] as String,
            description: row['description'] as String,
            img: row['coverUrl'] as String,
            date: row['date'] as String,
            pageCount: row['pageCount'] as int,
            downloadUrl: row['downloadUrl'] as String));
  }

  @override
  Future<void> insertBook(BookModel book) async {
    await _bookModelInsertionAdapter.insert(
        book, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeBook(BookModel bookModel) async {
    await _bookModelDeletionAdapter.delete(bookModel);
  }
}