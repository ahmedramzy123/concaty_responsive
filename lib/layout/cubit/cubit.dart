import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concaty/catch_helper/catch_helper.dart';
import 'package:concaty/component/constent.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:concaty/models/model_categories.dart';
import 'package:concaty/models/model_database.dart';
import 'package:concaty/models/model_devices.dart';
import 'package:concaty/models/model_men.dart';
import 'package:concaty/models/model_more.dart';
import 'package:concaty/models/model_product.dart';
import 'package:concaty/models/model_thebest.dart';
import 'package:concaty/models/model_user.dart';
import 'package:concaty/modules/home/home_screen.dart';
import 'package:concaty/modules/me/me_screen.dart';
import 'package:concaty/modules/more/more_screen.dart';
import 'package:concaty/modules/mycar/car_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sqflite/sqflite.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() :super(InitialShopAppState());

  static ShopAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void ChangeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeBottomCurrent());
  }

  List<Widget> screen = [
    HomeScreen(),
    MeScreen(),
    MyCarScreen(),
    MoreScreen()
  ];

  void backToHomeScreen() {
    currentIndex = 0;
    emit(BackToHomeScreenState());
  }

  List<ModelCategories> list = [];

  void getData() {
    FirebaseFirestore.instance.collection("categories").get().then((value) {
      value.docs.forEach((element) {
        list.add(ModelCategories.fromJson(element.data()));
      });
      emit(GetCategoriesSuccessState());
    });
  }

  List<ModelProduct> product = [];

  void productData() {
    FirebaseFirestore.instance.collection("product").get()
        .then((value) {
      value.docs.forEach((element) {
        product.add(ModelProduct.fromJson(element.data()));
      });
      emit(GetProductSuccessState());
    });
  }

  List<ModelDevices> devices = [];

  void dataDevices() {
    FirebaseFirestore.instance
        .collection("devices")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        devices.add(ModelDevices.fromJson(element.data()));
      });
      emit(GetDevicesSuccessState());
    });
  }

  List<ModelMen> men = [];

  void dataMen() {
    emit(GetMenLoadingState());
    FirebaseFirestore.instance
        .collection("categories")
        .doc("Cv72GN4zfNNrbzyNA1Lw")
        .collection("men")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        men.add(ModelMen.fromJson(element.data()));
      });
      emit(GetMenSuccessState());
    });
  }

  ModelUser? user;

  void getUserData() {
    FirebaseFirestore.instance
        .collection("users")
        .doc("n5OFEnu1tvYtDPiwTc9F7qqyaFk1")
        .get()
        .then((value) {
      user = ModelUser.fromJson(value.data()!);
    }).catchError((error) {
      emit(GetUsersErrorState(error.toString()));
    });
  }

  File? image;

  void getImage() async
  {
    ImagePicker x = ImagePicker();
    dynamic y = await x.pickImage(source: ImageSource.gallery);
    image = File(y.path);
    emit(GetImageSuccessState());
  }

  void putImage({
    required String name,
    required String phone,
  }) {
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(image!.path)
        .pathSegments
        .last}')
        .putFile(image!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        emit(PutImageSuccessState());
        updateData(name: name, phone: phone, image: value);
      });
    });
  }

  void updateData({
    required String name,
    required String phone,
    required String image,
  }) {
    FirebaseFirestore.instance
        .collection("users")
        .doc("n5OFEnu1tvYtDPiwTc9F7qqyaFk1")
        .update(<String, dynamic>
    {
      "name": name,
      "phone": phone,
      "image": image
    }).then((value) {});
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> city =[
    "القاهرة",
    "الإسكندرية",
    "الجيزة",
    "الغربية",
    "بور سعيد",
    "الدقهلية",
    "كفر الشيخ",
    "السويس",
  ];

  void showButtonSheet() {
    scaffoldKey.currentState!.showBottomSheet((context) =>
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("اختر موقع التوصيل",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      scaffoldKey.currentState!.showBottomSheet((context) =>
                          Container(
                            height: 300,
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("الرجاء اختيار المحافظة",
                                    style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  Container(
                                    height: 1, color: Colors.grey[300],),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text("المحافظات", style: TextStyle(
                                      color: HexColor("084505"),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: 15,),
                                  Expanded(
                                    child: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Text("${city[index]}",
                                                      style: TextStyle(fontSize: 18),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            Container(height: 1,
                                              color: Colors.grey[300],),
                                        itemCount: city.length),
                                  )

                                ]
                            ),
                          ));
                    }, child: Text("الرجاء اختيار المدينة")),
                    Icon(Icons.location_city),
                  ],
                )
              ]
          ),
        ));
    emit(ShowButtonSheetState());
  }

  bool check = false;

  void changeCheck() {
    check = !check;
    check2 = false;
    check3 = false;
    emit(ChangeCheckState());
  }

  bool check2 = false;

  void changeCheck2() {
    check2 = !check2;
    check = false;
    check3 = false;
    emit(ChangeCheckState());
  }

  bool check3 = false;

  void changeCheck3() {
    check3 = !check3;
    check = false;
    check2 = false;
    emit(ChangeCheckState());
  }

  bool time = false;

  void changeTime() {
    time = !time;
    time1 = false;
    time2 = false;
    emit(ChangeTimeState());
  }

  bool time1 = false;

  void changeTime1() {
    time1 = !time1;
    time = false;
    time2 = false;
    emit(ChangeTimeState());
  }

  bool time2 = false;

  void changeTime2() {
    time2 = !time2;
    time = false;
    time1 = false;
    emit(ChangeTimeState());
  }

  List<ModelTheBest> best = [];

  void getDataBest() {
    emit(GetBestLoadingState());
    FirebaseFirestore.instance
        .collection("thebest")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        best.add(ModelTheBest.fromJson(element.data()));
      });
      emit(GetBestSuccessState());
    }).catchError((error) {
      emit(GetBestErrorState(error.toString()));
    });
  }

  List<ModelMore> more = [];

  void getDataMore() {
    emit(GetMoreLoadingState());
    FirebaseFirestore.instance
        .collection("more")
        .get()
        .then((value) {
      more = [];
      value.docs.forEach((element) {
        more.add(ModelMore.fromJson(element.data()));
      });
      emit(GetMoreSuccessState());
    }).catchError((error) {
      emit(GetMoreErrorState(error.toString()));
    });
  }

  int index = 0;

  void AddInd() {
    index++;
    emit(AddIndexSuccessState());
  }

  void MinInd() {
    index--;
    emit(MinIndexSuccessState());
  }

  Database? database;

  Future<Database> createDataBase() async
  {
    return database = await openDatabase(
        "ShopApp.db",
        version: 1,
        onCreate: (database, version) {
          print("database created");
          database.execute(
              "CREATE TABLE concaty(name TEXT ,image TEXT, price TEXT , quantity INTEGER)"
          ).then((value) {
            print("table created");
            emit(CreateTableSuccessState());
          });
        },
        onOpen: (database) {
          getDataTable(database).then((value)
          {
            shopdata=(value).cast<ModelDatabase>();
            emit(GetTableSuccessState());
          });

          print("table open");
        }

    );
  }

  void insertData(ModelDatabase model) async
  {
    await database!.transaction((txn) async
    {
      await txn.rawInsert(
          'INSERT INTO concaty(name, image, price,quantity) '
              'VALUES("${model.name}","${model.image}" ,"${model.price}" ,"${model.quantity}")'
      ).then((value) {
        print("Insert Success");
      });
    });
  }

  List<ModelDatabase> shopdata = [];


  Future<List<ModelDatabase>> getDataTable(database) async
  {
    List<Map> maps = await database!.query("concaty");
    shopdata = maps.map((e) => ModelDatabase.fromJson(e)).toList();
    return shopdata;
  }
  void deleteDataTAble(ModelDatabase model)async
  {
  return  await database!.rawDelete(

      "DELETE FROM concaty WHERE name = ?",["${model.name}"]

  ).then((value)
  {
    getDataTable(database);
    emit(DeleteTableSuccessState());
  });

  }
  void logOut()
  {
    CatchHelper.removeData(key: "uid");
    emit(LogOutState());
  }
}