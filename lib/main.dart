import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Grid View Builder'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,),
          itemCount: menuList.length,
          physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemBuilder: (context, index){
        final menu = menuList[index];

        return Container(
          height: size.height*0.2,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 1),
                      shape: BoxShape.circle
                  ),
                  child: Icon(menu.icon,color: Colors.white,size: 20,)
              ),
              const SizedBox(height: 5,),
              Text(menu.title,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0
                  )),
            ],
          ),
        );

          }),
    );
  }
}

