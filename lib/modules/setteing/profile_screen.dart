import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingProfileScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var user=ShopAppCubit.get(context).user;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("c0e6c1"),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LinearProgressIndicator(),
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          width: double.infinity,
                          height: 130,
                          color: HexColor("dadfdd"),
                        ),
                      ),

                         Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 51,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage("${user!.image}"),
                          ),
                        ),
                      ),
                      if(ShopAppCubit.get(context).image!=null)
                         Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 51,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(ShopAppCubit.get(context).image!),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        ShopAppCubit.get(context).getImage();
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        child: Center(child: Text("EDIT YOUR PICTURE")),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: Colors.grey[200],

                        ),
                      ),
                    ),
                    Spacer(),
                    Text("${user.name}",style: TextStyle(fontSize: 30),),
                    SizedBox(width: 30,),

                  ],
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "Edit your name"
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                      labelText: "Edit your Phone"
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                   InkWell(
                     onTap: ()
                     {
                       ShopAppCubit.get(context).putImage(phone: phone.text,name: name.text);
                     },
                     child:Container(
                       width: 140,
                       height: 50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadiusDirectional.circular(15),
                         color: HexColor("e3e503"),
                       ),
                       child: Center(child: Text("Submit",style: TextStyle(fontSize: 20),)),
                     ),
                   ),
                   SizedBox(width: 15,),
                   InkWell(
                     onTap: ()
                     {
                       Navigator.pop(context);
                     },
                     child:Container(
                       width: 140,
                       height: 50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadiusDirectional.circular(15),
                         color: HexColor("ecebd9 "),
                       ),
                       child: Center(child: Text("Not Now",style: TextStyle(fontSize: 20),)),
                     ),
                   ),
                    ],
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
