import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/modules/mycar/best_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class MyCarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text("Concaty",style:TextStyle(fontFamily: "Tapestry",fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold) ,),
            backgroundColor: HexColor("aefed6"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("الخاصة بك فارغة Conacty عربة تسوق",style: TextStyle(fontSize: 15,fontFamily: "Tapestry"),),
                        TextButton(onPressed: ()
                        {
                          Navigat(context, BestScreen());
                        }, child: Text("عرض التفاصيل",style: TextStyle(color: HexColor("4caf50")),)),
                      ],
                    ),
                    Container(
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Lottie.network("https://assets2.lottiefiles.com/packages/lf20_47pyyfcf.json"),
                    )
                  ],
                ),
                Container(
                  height: 2,
                  color: Colors.black,
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()
                  {
                    ShopAppCubit.get(context).backToHomeScreen();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        color: HexColor("ae3813"),
                      ),
                      child: Center(child: Text("متابعة التسوق",style: TextStyle(fontSize: 20))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
