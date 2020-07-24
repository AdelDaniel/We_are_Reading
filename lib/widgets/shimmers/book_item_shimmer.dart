import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      direction: ShimmerDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,

        ),
        height: 146,
        width: 140,
//        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      ),
    );
  }
}
