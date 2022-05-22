import 'package:concaty/models/model_product.dart';
import 'package:flutter/material.dart';

class BestSellerScreen extends StatelessWidget {
  ModelProduct? model;
  BestSellerScreen(this.model);
  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                      children: [
              InkWell(
                  onTap: (){},
                  child: Image.network("${model!.image}",height: 250,
                  fit: BoxFit.cover,

                  ))
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
              )
                ]);

  }
}
