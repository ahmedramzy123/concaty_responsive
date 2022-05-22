import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/modules/login/cubit/cubit_login.dart';
import 'package:concaty/modules/login/cubit/states_logon.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

class RigisterScreen extends StatelessWidget {
TextEditingController name =TextEditingController();
TextEditingController email =TextEditingController();
TextEditingController pass =TextEditingController();
TextEditingController phone =TextEditingController();
var FromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Sign Up",style: TextStyle(fontFamily: "Tapestry",fontSize: 30),),
            backgroundColor: HexColor("c0e6c1"),
          ),
          body: BlocProvider(
            create: (BuildContext context) =>ShopLoginCubit(),
            child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
              listener: (context,state){},
              builder: (context,state){
                return  SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: FromKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Text("Name",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
                                )
                            ),
                            child: TextFormField(
                              controller: name,
                              onTap: (){},
                              validator: (value){},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Ionicons.person)
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Email",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
                                )
                            ),
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "EMAIL",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email_outlined)
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Password",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
                                )
                            ),
                            child: TextFormField(
                              controller: pass,
                              obscureText: ShopLoginCubit.get(context).obscureText,
                              validator: (value){},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(icon:Icon(ShopLoginCubit.get(context).suffix),onPressed: ()
                                {
                                  ShopLoginCubit.get(context).ChangeIcon();
                                },),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Phone",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
                                )
                            ),
                            child: TextFormField(
                              controller: phone,
                              onTap: (){},
                              validator: (value){},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Phone",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone_android)
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                color: HexColor("c0e6c1"),
                              ),
                              child: ConditionalBuilder(
                                condition: state is! GetDataShopLoginLoading,
                                builder:(context)=> MaterialButton(onPressed: ()
                                {
                                  ShopLoginCubit.get(context).signUpData(
                                    email: email.text,
                                    password: pass.text,
                                    name: name.text,
                                    phone: phone.text,);

                                  //     phone: phone.text);
                                },child: Text("Sign UP",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "Tapestry"),),),
                                fallback: (context)=> Center(child: CircularProgressIndicator()),

                              )),

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );

  }
}
