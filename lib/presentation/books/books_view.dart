import 'package:challenge_2_escribo/presentation/books/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksView extends StatefulWidget {
  static String route = "/books";

  const BooksView({Key? key}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksView();
}

class _BooksView extends State<BooksView> {

  @override
  void initState() {
    super.initState();
    Provider.of<BooksViewModel>(context, listen: false).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Center(
              child: Text(
            'Livros',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
          )),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Consumer<BooksViewModel>(
          builder: (context, controller, child) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: controller.books.length,
              itemBuilder: (BuildContext context, int index) {
                return  Card(child: Column(
                  children: [
                    controller.books[index].coverUrl == '' 
                      ? Container()
                      : Image(
                        height: MediaQuery.of(context).size.height * 0.70,
                        width: 140,
                        image: NetworkImage(controller.books[index].coverUrl),
                      ),
                    const SizedBox(height: 5,),
                    Text(controller.books[index].title),
                    const SizedBox(height: 5,),
                    Text(controller.books[index].author)
                  ],
                ));
              },
            );
          },
        ));
  }
}
