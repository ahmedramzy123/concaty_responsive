import 'package:concaty/catch_helper/catch_helper.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/layout_screen.dart';
import 'package:concaty/modules/constant/constant.dart';
import 'package:concaty/modules/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  Fluttertoast.showToast(
      msg: "onBackgroundMessage",
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5 ,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,);
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CatchHelper.init();
  uid=CatchHelper.gateData(key: "uid");
  Widget widget;
  if(uid!=null)
    {
      widget=LayoutScreen();
    }
  else
    {
      widget =LoginScreen();
    }
  var token =await  FirebaseMessaging.instance.getToken();
  print(token);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((event)
  {
    Fluttertoast.showToast(
        msg: "onMessage",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5 ,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event)
  {
    Fluttertoast.showToast(
        msg: "onMessageOpenedApp",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5 ,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  });

  runApp( MyApp(startWidget: widget,));

}

class MyApp extends StatelessWidget {
final Widget startWidget;
MyApp({required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopAppCubit()..getData()..productData()..dataDevices()..dataMen()..getUserData()..createDataBase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:startWidget,
      ),
    );
  }
}

