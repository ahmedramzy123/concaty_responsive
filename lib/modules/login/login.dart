import 'package:concaty/catch_helper/catch_helper.dart';
import 'package:concaty/layout/layout_screen.dart';
import 'package:concaty/modules/login/cubit/cubit_login.dart';
import 'package:concaty/modules/login/cubit/states_logon.dart';
import 'package:concaty/modules/login/rigister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
TextEditingController email =TextEditingController();
TextEditingController pass =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state)
        {
          if(state is SuccessLoginUser)
            {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LayoutScreen()), (route) => false);
            }
          if(state is SuccessLoginUser)
          {
            CatchHelper.saveDAta(key: "uid", value: state.uid);
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor("c0e6c1"),
              title:Text(" Login ",style: TextStyle(fontSize: 30,fontFamily: "Tapestry",fontWeight: FontWeight.bold),),

            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" مرحبا بك في ",style: TextStyle(fontSize: 20),),
                          Row(
                            children: [
                              Text(" Concaty ",style: TextStyle(fontSize: 35,fontFamily: "Tapestry",fontWeight: FontWeight.bold),),
                              Spacer(),
                              TextButton(onPressed: ()
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RigisterScreen()));
                              }, child: Text("SignUp",style: TextStyle(fontSize: 30,color: Colors.green,fontFamily: "Tapestry",fontWeight: FontWeight.bold),))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
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
                          onTap: (){},
                          validator: (value){},
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "EMAIL",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.email_outlined)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
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
                          onTap: (){},
                          validator: (value){},
                          keyboardType: TextInputType.text,
                          obscureText: ShopLoginCubit.get(context).obscureText,
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(icon:Icon(ShopLoginCubit.get(context).suffix),onPressed: ()
                              {
                                ShopLoginCubit.get(context).ChangeIcon();
                              },),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            width: 110,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                color: HexColor("c0e6c1"),
                              ),
                              child: MaterialButton(onPressed: (){
                                ShopLoginCubit.get(context).loginUser(
                                    email: email.text,
                                    password: pass.text);
                              },child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "Tapestry"),),)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            border: Border.all(
                              width: 1,
                              color: Colors.black
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.network("https://www.saudiah.news/wp-content/uploads/2020/09/images-2020-09-17T235056.664.jpeg?v=1600379784",width: 40,height: 50,),
                            SizedBox(width: 20,),
                            Text("Sign in With Facebook"),
                          ],),
                        ),
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: ()
                        {
                          ShopLoginCubit.get(context).SignWithGoogle();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            border: Border.all(
                              width: 1,
                              color: Colors.black
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.network("https://gordonavidad.es/wp-content/uploads/2021/04/logo-google-300x275.jpg",width: 40,height: 50,),
                            SizedBox(width: 20,),
                            Text("Sign in With Google"),
                          ],),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
