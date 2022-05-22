import 'package:carousel_slider/carousel_slider.dart';
import 'package:concaty/models/model_product.dart';
import 'package:flutter/material.dart';

class ClothesMenCard extends StatelessWidget {
  ModelProduct? model;
  ClothesMenCard(this.model);
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Image.network("${model!.image}",
          fit: BoxFit.cover,

        )
        ,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("${model!.name}"),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${model!.coin}"),
                Text("${model!.price}"),


              ],
            ),
          ],
        )


      ],
    );

  }
}
