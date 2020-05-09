import 'package:flutter/material.dart';
import '../widgets/requests_internal_widget.dart';


class InternalRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251,192,45,1),
        title: Text(
          'Requests',
          style: TextStyle(
            color: Color.fromRGBO(255,255,255, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, i) => RequestsInternalWidget(),
      ),
    );
  }
}

