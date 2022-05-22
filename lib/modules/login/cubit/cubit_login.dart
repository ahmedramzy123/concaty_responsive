import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concaty/models/model_login.dart';
import 'package:concaty/modules/login/cubit/states_logon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(ShopLoginInitial());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  bool obscureText =true;
  IconData suffix = Icons.visibility;
  ModelSignup? modelSignup;
void ChangeIcon()
{
  obscureText=!obscureText;
  suffix=obscureText?Icons.visibility:Icons.visibility_off_outlined;
  emit(ChangeIconState());

}
  void signUpData({
  required String email,
  required String password,
  required String name,
  required String phone,
})
  {
    emit(GetDataShopLoginLoading());
    FirebaseAuth.instance.createUserWithEmailAndPassword
      (
        email: email,
        password: password).then((value)
    {
      ModelSignup model =ModelSignup(
        email: email,
        phone: phone,
        uid: value.user!.uid,
        name: name,
        image: "https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?w=740&t=st=1650540836~exp=1650541436~hmac=5d52f9c445b5d7d25bd943c994e9808fff6df6a53cf596134789a3899b534d5c"

      );
      FirebaseFirestore.instance.collection("users").doc(value.user!.uid).set(model.toMap());
      emit(GetDataShopLoginSuccess());
    });
  }
void loginUser({
  required String email,
  required String password,
})
{
  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password).then((value)
  {
    if(value.user!.uid==FirebaseAuth.instance.currentUser!.uid)
      {
        emit(SuccessLoginUser(value.user!.uid));
      }
  });
}
void SignWithGoogle()async
{
  GoogleSignIn googleSignIn=GoogleSignIn(
    scopes: ["email"]
  );
   await googleSignIn.signIn();
   emit(SuccessSignupGoogle());
}
}