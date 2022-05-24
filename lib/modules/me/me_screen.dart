import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/modules/login/login.dart';
import 'package:concaty/modules/purchases/purchases.dart';
import 'package:concaty/modules/setteing/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

class MeScreen extends StatelessWidget {
//hello
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state)
      {
        if (state is LogOutState)
          {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
          }
      },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text("Concaty",style:TextStyle(fontFamily: "Tapestry",fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold) ,),
            backgroundColor: HexColor("aefed6"),
            actions: [
              IconButton(onPressed: (){},icon: Icon(Ionicons.search,color: Colors.black,),),
              IconButton(onPressed: (){},icon: Icon(Ionicons.notifications_circle_outline,color: Colors.black,),),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage("${ShopAppCubit.get(context).user!.image}"),
                      ),
                      Spacer(),
                      Text("${ShopAppCubit.get(context).user!.name}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily:"Tapestry" ),),
                      Text(" ،مرحبا",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      // Container(
                      //   width: 160,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadiusDirectional.circular(15),
                      //       color:  HexColor("d8e4de"),
                      //       border: Border.all(
                      //           width: 1,
                      //           color: Colors.black
                      //       )
                      //   ),
                      //   child: Center(child: Text("شراء مرة اخرى",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                      // ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingProfileScreen()));
                        },
                        child: Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(15),
                              color:  HexColor("d8e4de"),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: Center(child: Text("حسابك",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                        {
                          Navigat(context, purchasesScreen());
                        },
                        child: Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(15),
                              color:  HexColor("d8e4de"),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: Center(child: Text("مشترياتك",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      // InkWell(
                      //   onTap: ()
                      //   {
                      //     Navigat(context, yourlistsScreen());
                      //   },
                      //   child: Container(
                      //     width: 160,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadiusDirectional.circular(15),
                      //         color:  HexColor("d8e4de"),
                      //         border: Border.all(
                      //             width: 1,
                      //             color: Colors.black
                      //         )
                      //     ),
                      //     child: Center(child: Text("قوائمك",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                      //   ),
                      // ),
                      SizedBox(width: 10,),

                    ],
                  ),
                  SizedBox(height: 20,),
                  // Text("مشترياتك",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(".مرحبا ، ليس لديك طلبات حديثة ",style: TextStyle(fontSize: 20),),
                  InkWell(
                    onTap: (){
                      ShopAppCubit.get(context).backToHomeScreen();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          border: Border.all(
                              width: 1,
                              color: Colors.black
                          )
                      ),
                      child:Center(child: Text("العودة الى الصفحة الرئيسية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: ()
                    {
                      ShopAppCubit.get(context).logOut();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          color:HexColor("dd2d31"),
                      ),
                      child:Center(child: Text("Logout",style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold),)),

                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
