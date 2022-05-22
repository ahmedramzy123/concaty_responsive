import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

class LayoutScreen extends StatelessWidget {
//4caf50
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor:HexColor("242624"),
            selectedIconTheme: IconThemeData(color:HexColor("4caf50") ),
            currentIndex: ShopAppCubit.get(context).currentIndex,
            onTap: (index)
            {
              ShopAppCubit.get(context).ChangeCurrentIndex(index);
            },

            items: [
              BottomNavigationBarItem(icon: Icon(Ionicons.home),label: "home"),
              BottomNavigationBarItem(icon: Icon(Ionicons.person),label: "me"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "my car"),
              BottomNavigationBarItem(icon: Icon(Ionicons.menu),label: "more"),

            ],
          ),
          body: ShopAppCubit.get(context).screen[ShopAppCubit.get(context).currentIndex]
        );
      },
    );
  }
}
