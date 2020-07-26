import 'package:flutter/material.dart';
import 'package:graduation/mixins/alerts_mixin.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/providers/books.dart';
import 'package:graduation/widgets/shimmers/book_item_shimmer.dart';
import 'package:provider/provider.dart';

import './add_book_screen.dart';
import '../widgets/my_upload_widget.dart';

class MyUploadScreen extends StatefulWidget {
  @override
  _MyUploadScreenState createState() => _MyUploadScreenState();
}

class _MyUploadScreenState extends State<MyUploadScreen> with AlertsMixin{
  Books _booksReference;
  bool _isLoading = false;

  Future<void> _fetchUploads() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final xx = await _booksReference.fetchUploads();
      print(_booksReference.uploads.length);
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
        _fetchUploads();
      _firstCalled = true;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Books>(
          builder: (_, books, __) => !_isLoading && books.uploads.length == 0 ?
          Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Image.asset('assets/images/undraw_no_data_qbuo.png'),
              Text('no books yet...',
              style: TextStyle(
                color: Color(0xFFB2B0B0),
                fontSize: 29,
              ),)
            ],
          ) :
         GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: books.uploads.length == 0 && _isLoading ? 6 : books.uploads.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (ctx, i) => books.uploads.length == 0 && _isLoading ? BookItemShimmer() : MyUploadWidget(
            id: books.uploads[i].id,
            title: books.uploads[i].title,
            author: books.uploads[i].author,
            copiesCount: books.uploads[i].copiesCount,
            coverPhotoId: books.uploads[i].coverPhotoId,
            description: books.uploads[i].description,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
//        onPressed: (){},
        elevation: 5,
        backgroundColor: Colors.blue,
        child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddBookScreen.routeName)),
      ),
    );
  }
}
