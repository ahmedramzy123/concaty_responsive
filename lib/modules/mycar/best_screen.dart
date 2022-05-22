import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_thebest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class BestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("aefed6"),

          ),
          body: Builder(
            builder: (context) {
              ShopAppCubit.get(context).getDataBest();
              if(state is GetBestLoadingState)
                LinearProgressIndicator();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 Text("أ فضل الاختيارات لك ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                   Expanded(
                     child: GridView.count(
                         crossAxisCount: 2,
                         padding: EdgeInsetsDirectional.all(10),
                         mainAxisSpacing: 5,
                         crossAxisSpacing: 10,

                         childAspectRatio: 1 / 1.6,
                         children: List.generate(
                             ShopAppCubit.get(context).best.length,
                               (index) =>  bultItem(ShopAppCubit.get(context).best[index],context)),
                     ),
                   ),

                ],
              );
            }
          ),
        );
      },

    );
  }
}
 Widget bultItem(ModelTheBest model,context)=>Column(
     children: [
       Stack(
         alignment: AlignmentDirectional.bottomEnd,
         children: [
           InkWell(
               onTap: (){},
               child: Image.network("${model.image}",height: 250,

               ))
           ,
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Text("${model.name}",maxLines: 2,overflow: TextOverflow.ellipsis),
               Row(mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text("جنية"),
                   Text("${model.price}"),


                 ],
               ),
             ],
           )


         ],
       )
     ]);
