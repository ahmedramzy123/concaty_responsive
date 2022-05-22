import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
class Button extends StatelessWidget {
  String text;
      String color;
      String name;
      String image;
      String price;
      int quantity;
  Button(this.text,this.color,this.price,this.image,this.name,this.quantity);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return InkWell(
          onTap: ()
          {
            ShopAppCubit.get(context).insertData(
                ModelDatabase(price, name, image, 1));
          },
          child:   Container(

            width: 140,

            height: 50,

            decoration: BoxDecoration(

                borderRadius: BorderRadiusDirectional.circular(15),

                color: HexColor(color)

            ),

            child: Center(child: Text(text,style: TextStyle(fontSize: 20, ),)),

          ),
        );
      },
    );
  }
}

// Widget Button({
//   required String text,
//   required String color
//
// }) => InkWell(
//   onTap: ()
//   {
//
//   },
//   child:   Container(
//
//     width: 140,
//
//     height: 50,
//
//     decoration: BoxDecoration(
//
//       borderRadius: BorderRadiusDirectional.circular(15),
//
//       color: HexColor(color)
//
//     ),
//
//     child: Center(child: Text(text,style: TextStyle(fontSize: 20, ),)),
//
//   ),
// );

void Navigat(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
