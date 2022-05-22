import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_more.dart';
import 'package:concaty/modules/purchases/purchases.dart';
import 'package:concaty/modules/setteing/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ShopAppCubit.get(context).getDataMore();
        return BlocConsumer<ShopAppCubit,ShopAppStates>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(
                backgroundColor: HexColor("c0e6c1"),
                title: Text("Concaty",style:TextStyle(fontFamily: "Tapestry",fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold) ,),
              ),
              body: Column(
                children: [
                  Container(
                    color: HexColor("c8e6c9"),
                    height: 440,
                    child: GridView.count
                      (crossAxisCount: 3,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsetsDirectional.all(10),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.6,
                      children: List.generate(
                          ShopAppCubit.get(context).more.length,
                              (index) => bultItem(ShopAppCubit.get(context).more[index])),),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [

                        SizedBox(width: 10,),
                        InkWell(
                          onTap: ()
                          {
                            Navigat(context, SettingProfileScreen());
                          },
                          child: Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                              border: Border.all(width: 1,color: Colors.black),
                            ),
                            child: Center(child: Text("الحساب",style: TextStyle(fontSize: 16),)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: ()
                          {
                            Navigat(context, purchasesScreen());
                          },
                          child: Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                              border: Border.all(width: 1,color: Colors.black),
                            ),
                            child: Center(child: Text("مشترياتك",style: TextStyle(fontSize: 16),)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
    );
  }
}
Widget bultItem(ModelMore model)=>Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(15),
          border: Border.all(width:1,color: Colors.black ),
          image: DecorationImage(
              image: NetworkImage("${model.image}"),
              fit: BoxFit.cover
          )
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
          height: 30,
          color: Colors.black.withOpacity(.6),
          child: Text("${model.name}",
            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )),
    )
  ],
);
