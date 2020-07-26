import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class AddPhotoAvatar extends StatelessWidget {
  const AddPhotoAvatar({
    Key key,
    @required File image,
   String photoId
  })  : _image = image,
        _photoId = photoId,
        super(key: key);

  final File _image;
  final String _photoId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.9),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: _photoId == null? CircleAvatar(
        radius: 80,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: _image == null
              ?  Image.asset(
            'assets/images/photo.png',
            width: 100,
            height: 100,
          )
              : Image.file(
            _image,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
      ) : CircleAvatar(
        radius: 80,
        backgroundImage: CachedNetworkImageProvider(
       'https://wearereading20200721193701.azurewebsites.net/Images/BookCovers/$_photoId',

        ) ,
      ),
    );
  }
}
