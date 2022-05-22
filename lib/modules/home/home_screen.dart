import 'package:carousel_slider/carousel_slider.dart';
import 'package:concaty/Card/card_clothes_men/clothesCard.dart';
import 'package:concaty/Card/card_slider/slider_screen.dart';
import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_categories.dart';
import 'package:concaty/models/model_product.dart';
import 'package:concaty/modules/categories/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state)
      {},
      builder: (context, state) {
        return Scaffold(
          key: ShopAppCubit.get(context).scaffoldKey,
          appBar: AppBar(
            backgroundColor: HexColor("aefed6"),
            title: Text("Concaty",style:TextStyle(fontFamily: "Tapestry",fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold) ,),

          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: HexColor("aefed6")),
                  child: InkWell(
                    onTap: ()
                    {
                      ShopAppCubit.get(context).showButtonSheet();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Ionicons.location_outline),
                          Text("الرجاء اختيار موقعك للتوصيل ")
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => builditem(ShopAppCubit.get(context).list[index],context),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: ShopAppCubit.get(context).list.length),
                ),
                SliderScreen(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "الأكثر مبيعا",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: double.infinity,
                    //       height: 200,
                    //       padding: EdgeInsets.all(10),
                    //       child: ListView.builder(
                    //           itemBuilder: (context,index)=>GestureDetector(
                    //             onTap: (){},
                    //             child: ClothesMenCard(ShopAppCubit.get(context).product[index],
                    //             )   ),
                    //         itemCount:ShopAppCubit.get(context).product.length ,
                    //         scrollDirection: Axis.horizontal,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Container(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>GestureDetector(
                              onTap: ()
                              {
                                Navigat(context, DetailsViewScreen(ShopAppCubit.get(context).product[index]));
                              },
                              child: ClothesMenCard(ShopAppCubit.get(context).product[index])),
                          separatorBuilder: (context,index)=>SizedBox(width: 10,),
                          itemCount:  ShopAppCubit.get(context).product.length),
                    ),

                SizedBox(
                  height: 5,
                ),
                Text("ملابس الرجال",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>GestureDetector(
                              onTap: ()
                              {
                                Navigat(context, DetailsViewScreen(ShopAppCubit.get(context).product[index]));
                              },
                              child: ClothesMenCard(ShopAppCubit.get(context).product[index])),
                          separatorBuilder: (context,index)=>SizedBox(width: 10,),
                          itemCount:  ShopAppCubit.get(context).product.length),
                    )
              ]),
            ),
          ),
        );
      },
    );
  }

  Widget builditem(ModelCategories model,context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            InkWell(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (conext)=>MenScreen(model)));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("${model.image}"),
                  ),
                  Text("${model.name}",style: TextStyle( fontFamily: "Tapestry"),),
                ],
              ),
            )
          ],
        ),
      );
  Widget DetailsViewScreen(ModelProduct model,)=> Scaffold(
    appBar: AppBar(
      backgroundColor: HexColor("a5dda7"),

    ),
    body: SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: double.infinity,
                  // width: double.infinity,
                  height: 250,
                  child:  CarouselSlider(items:
                  [
                    Image.network("${model.image}",fit: BoxFit.cover,),
                    Image.network("${model.imageright}",fit: BoxFit.cover,),
                    Image.network("${model.imagedown}",fit: BoxFit.cover,),
                  ], options: CarouselOptions(
                    autoPlay: false,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    viewportFraction: 1,

                  ))),

              Text("${model.name}",style: TextStyle(fontSize: 30),),
              Text("${model.description}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 90,),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price",style: TextStyle(fontSize: 20),),
                    Text("${model.price}",style: TextStyle(fontSize: 20),),
                  ],
                ),
                Spacer(),
               Button("ADD", "e4dc19","${model.price}","${model.image}","${model.name}",1)
              ],)


            ],
          ),
        ),
      ),
    ),
  );
}
