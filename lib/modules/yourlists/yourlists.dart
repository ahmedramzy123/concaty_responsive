import 'package:concaty/component/component.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class yourlistsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("a5dda7"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Stack(
                alignment:AlignmentDirectional.topCenter ,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://img.freepik.com/free-psd/online-shopping-with-laptop-mockup-template-shopping-elements_1150-38896.jpg?t=st=1651957558~exp=1651958158~hmac=4deb839ddf175f3ed340b4b47bf0b68c4af3e8ed225af3bdb34b3ba7404cd813&w=740")
                            )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(5),
                            color: HexColor("e3e503"),
                          ),
                          child: Center(child: Text("انشئ قائمة",style: TextStyle(fontSize: 20))),
                        ),
                      )

                    ],

                  ),
                  Text("القوائم",style: TextStyle(fontSize: 30,color: Colors.white),)
                ],

              ),
              Text("لجميع احتياجات التسوق الخاصة بك",style: TextStyle(fontSize: 25,color: Colors.white),)
            ],

          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("  وفر الوقت ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text(" أضف السبع والأفكار الخاصة بك  في موقع واحد مناسب "),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("قدم هدايا رائعة",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("تذكر قوائم أصدقائك وشاركها"),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("تحقق من تغيرات الأسعار",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("تحقق من انخفاض أسعار السلع في القائمه الخاصه بك"),
            ],
          ),
          Container(
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
