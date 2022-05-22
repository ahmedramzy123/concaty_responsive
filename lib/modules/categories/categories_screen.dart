import 'package:carousel_slider/carousel_slider.dart';
import 'package:concaty/Card/card_best_sseller/bestseller_screen.dart';
import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_categories.dart';
import 'package:concaty/models/model_men.dart';
import 'package:concaty/modules/devices/devices_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MenScreen extends StatelessWidget {
  ModelCategories modelcategories;
  MenScreen(this.modelcategories);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state) {},
      builder: (context,state){
        return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor("a5dda7"),
              title: Text("${modelcategories.name}"),
            ),
          body:   Builder(
            builder: (context) {
              if(modelcategories.name=="Men")
              {
                return Container(
                  color: Colors.grey[300],
                  child: Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsetsDirectional.all(10),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.6,
                      children:
                      List.generate(
                          ShopAppCubit.get(context).men.length,
                              (index) => GestureDetector(
                                onTap: ()
                                {
                                  Navigat(context, DetailsViewScreen(ShopAppCubit.get(context).men[index]));
                                },
                                child: DevicesScreen(ShopAppCubit.get(context).men[index]
                          ),
                              )
                      ),
                    ),
                  ),
                );
              }
              else if (modelcategories.name=="Devices")
                {
                  return Container(
                  color: Colors.grey[300],
                  child: Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsetsDirectional.all(10),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.6,
                      children:
                      List.generate(
                          ShopAppCubit.get(context).product.length,
                              (index) => BestSellerScreen(ShopAppCubit.get(context).product[index]
                          )
                      ),
                    ),
                  ),
                );
                }

              return Container(
                color: Colors.grey[300],
                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsetsDirectional.all(10),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.6,
                    children:
                    List.generate(
                        ShopAppCubit.get(context).product.length,
                            (index) => BestSellerScreen(ShopAppCubit.get(context).product[index]
                        )
                    ),
                  ),
                ),
              );

            }
          ),
        );
      },
    );
  }
  Widget DetailsViewScreen(ModelMen model)=>Scaffold(
    appBar: AppBar(
      backgroundColor: HexColor("a5dda7"),
      title: Text("${modelcategories.name}"),
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
                    // Image.network("${model.image}",fit: BoxFit.cover,),
                    if(model.imagedown!.isEmpty && model.imageright!.isEmpty)
                      Image.network("${model.image}",fit: BoxFit.cover,),
                    if(model.imagedown!.isNotEmpty || model.imageright!.isNotEmpty)
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
