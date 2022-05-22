import 'package:concaty/component/component.dart';
import 'package:concaty/layout/cubit/cubit.dart';
import 'package:concaty/models/model_database.dart';
import 'package:concaty/modules/filtering/filtering_%D9%8DScreen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';

class purchasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("a5dda7"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "الطلبات الخاصة بك",
              style: TextStyle(color: HexColor("0f9a54"), fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigat(context, filteringScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        "تصفية",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "بحث ضمن كل الطلبات",
                          icon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadiusDirectional.circular(5)),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),

            ConditionalBuilder(
                condition: ShopAppCubit.get(context).shopdata.isNotEmpty
              , builder: (context)=> Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => bultItem(
                    ShopAppCubit.get(context).shopdata[index], context,),
                  separatorBuilder: (context, index) => Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  itemCount: ShopAppCubit.get(context).shopdata.length),
            ),
               fallback:  (context)=> Column(
              children: [
                Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.grey[200],
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text("اخر 6 شهور", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),))),
                Text(
                    "لم يتم العثور على طلبات او حركات . يرجى تحديد مدة زمنية مختلفة او نوع طلب مختلف"),
              ],
            ),)

          ],
        ),
      ),
    );
  }
}

Widget bultItem(ModelDatabase model, context) => Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    SizedBox(
      height: 10,
    ),

    Slidable(
      child: Container(
        width: double.infinity,
        height: 150,
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

    // SlidableAction(

    //     onPressed: null,

    //   icon: Icons.delete,

    //

    // )
  ],
);
