import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("",
          width: double.infinity,
          fit: BoxFit.cover,)
      ],
    );
  }
}
