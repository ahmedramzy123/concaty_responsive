import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_database.dart';
import 'package:concaty/modules/mycar/best_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
          body: ConditionalBuilder(
            condition: ShopAppCubit.get(context).shopdata.isNotEmpty ,
            builder: (context)=> Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 400,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => bultItem(
                        ShopAppCubit.get(context).shopdata[index], context,),
                      separatorBuilder: (context, index) => Container(
                        height: 2,
                        color: Colors.grey[400],
                      ),
                      itemCount: ShopAppCubit.get(context).shopdata.length),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: ()
                  {
                    Fluttertoast.showToast(
                      msg: "تم ارسال الطلب",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5 ,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,);
                  }

                  ,child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color:  HexColor("e4dc19"),
                    ),

                    child: Center(child: Text("ADD",style: TextStyle(fontSize: 20, )))),),
                SizedBox(height: 30,),
              ],
            ),
            fallback:(context)=>SingleChildScrollView(
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

          ),
        );
      },
    );
  }
}
Widget bultItem(ModelDatabase model, context) => Padding(
  padding: const EdgeInsets.symmetric(
    vertical: 15,
  ),
  child:   Slidable(
    child: Container(
      width: double.infinity,
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            "${model.image}",
            width: 150,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${model.name}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${model.price}",
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 110,
                height: 40,
                color: Colors.grey[300],
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    Text("${model.quantity}"),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.remove))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (value)
          {
            ShopAppCubit.get(context)
                .deleteDataTAble(model);
          },
          key: Key("${model.name}"),
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),

      ],
    ),
  ),
);