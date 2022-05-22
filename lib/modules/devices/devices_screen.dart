import 'package:concaty/models/model_devices.dart';
import 'package:concaty/models/model_men.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
ModelMen? model;
DevicesScreen(this.model);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image.network("${model!.image}",height: 250,
                fit: BoxFit.cover,

              )
              ,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${model!.name}"),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
