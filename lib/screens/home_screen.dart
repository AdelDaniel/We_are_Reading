import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/mixins/alerts_mixin.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/providers/books.dart';
import 'package:graduation/widgets/shimmers/book_item_shimmer.dart';
import 'package:provider/provider.dart';

import '../widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AlertsMixin {

  Books _booksReference;
  bool _isLoading = false;

  Future<void> _fetchBooks() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final xx = await _booksReference.fetchBooks();
      print(_booksReference.books.length);
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
//        _authReference.logoutDone();
      } else {
        showErrorDialog(context, error.toString());
      }
    } catch (error) {
      throw error;
    }
    finally {
      if (this.mounted)
        setState(() {
          _isLoading = false;
        });
    }
  }

  @override
  void initState() {
    _booksReference = Provider.of<Books>(context, listen: false);
    super.initState();
  }

  bool _firstCalled = false;
  @override
  void didChangeDependencies() {
    if (!_firstCalled) {
      _fetchBooks();
      _firstCalled = true;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Books>(
      builder: (_, books, __) =>
       GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: books.books.length == 0 && _isLoading ? 6 : books.books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => books.books.length == 0 && _isLoading ? BookItemShimmer() : BookItem(
            id: books.books[i].id,
            title: books.books[i].title,
            author: books.books[i].author,
            copiesCount: books.books[i].copiesCount,
            coverPhotoId: books.books[i].coverPhotoId,
          ),
        ),
    );

  }
}
