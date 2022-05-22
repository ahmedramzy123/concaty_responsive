import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class filteringScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("a5dda7"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      InkWell(
                        onTap: ()
                        {},
                        child: Container(
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            color: HexColor("e3e503"),
                          ),
                          child: Center(child: Text("تطبيق",style: TextStyle(fontSize: 20),)),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){ Navigator.pop(context);},
                        child: Row(
                          children: [
                            Text("رجوع",style: TextStyle(fontSize: 20),),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 1.5,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10,),
                  Text("نوع الطلب",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CheckboxListTile(
                            value: ShopAppCubit.get(context).check,
                            onChanged: (value)
                            {
                              ShopAppCubit.get(context).changeCheck();
                            },
                            title: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text("الطلبات")),
                            controlAffinity:
                            ListTileControlAffinity.platform,
                            activeColor: HexColor("0e5a34"),
                            checkColor: Colors.white,

                          ),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          CheckboxListTile(
                            value: ShopAppCubit.get(context).check2,
                            onChanged: (value)
                            {
                              ShopAppCubit.get(context).changeCheck2();
                            },
                            title: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text("لم يتم الشحن بعد")),
                            controlAffinity:
                            ListTileControlAffinity.platform,
                            activeColor: HexColor("0e5a34"),
                            checkColor: Colors.white,

                          ),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          CheckboxListTile(
                            value: ShopAppCubit.get(context).check3,
                            onChanged: (value)
                            {
                              ShopAppCubit.get(context).changeCheck3();
                            },
                            title: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text("الطلبات الملغاة")),
                            controlAffinity:
                            ListTileControlAffinity.platform,
                            activeColor:HexColor("0e5a34"),
                            checkColor: Colors.white,

                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        color: Colors.grey[200],

                      ),
                    ),
                  ),
                  if(ShopAppCubit.get(context).check==true)
                      Text(" تصنيف الوقت",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  if(ShopAppCubit.get(context).check==true)
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CheckboxListTile(
                            value: ShopAppCubit.get(context).time,
                            onChanged: (value)
                            {
                              ShopAppCubit.get(context).changeTime();
                            },
                            title: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text("اخر 30 يوم")),
                            controlAffinity:
                            ListTileControlAffinity.platform,
                            activeColor: HexColor("0e5a34"),
                            checkColor: Colors.white,

                          ),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          CheckboxListTile(
                            value: ShopAppCubit.get(context).time1,
                            onChanged: (value)
                            {
                              ShopAppCubit.get(context).changeTime1();
                            },
                            title: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text("اخر 6 شهور")),
                            controlAffinity:
                            ListTileControlAffinity.platform,
                            activeColor: HexColor("0e5a34"),
                            checkColor: Colors.white,

                          ),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          CheckboxListTile(
                            value: ShopAppCubit.get(context).time2,
                            onChanged: (value)
                            {
                              ShopAppCubit.get(context).changeTime2();
                            },
                            title: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text(" 2022")),
                            controlAffinity:
                            ListTileControlAffinity.platform,
                            activeColor:HexColor("0e5a34"),
                            checkColor: Colors.white,

                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        color: Colors.grey[200],

                      ),
                    ),
                  ),
                 InkWell(
                   onTap: (){},
                   child: Container(
                     width: double.infinity,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadiusDirectional.circular(15),
                       color: HexColor("e3e503"),
                     ),
                     child: Center(child: Text("تطبيق",style: TextStyle(fontSize: 20),)),
                   ),
                 ),
                  SizedBox(height: 5,),
                  Text("لن يتم تطبيق عامل تصفية الوقت على الطلبات المفتوحة او الملغاة",style: TextStyle(fontSize:14.5 ),),




                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
