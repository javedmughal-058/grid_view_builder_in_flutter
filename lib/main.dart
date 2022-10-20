import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/views/WelcomePage/WelcomePage.dart';
import 'package:grid_view_builder_in_flutter/views/about.dart';
import 'package:grid_view_builder_in_flutter/views/contact.dart';
import 'package:grid_view_builder_in_flutter/views/detail.dart';
import 'package:grid_view_builder_in_flutter/views/search.dart';
import 'package:grid_view_builder_in_flutter/views/setting.dart';
import 'package:grid_view_builder_in_flutter/views/verify.dart';
import 'package:grid_view_builder_in_flutter/widgets/customTabBar.dart';
import 'package:grid_view_builder_in_flutter/views/customTableView.dart';

import 'views/login/loginPage.dart';


void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            fontSize: 18,
          ),
          headline2: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
          subtitle1: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 14,

          ),
          subtitle2: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 14,

          ),
          bodyText1: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      home: const WelcomePage(),
      routes: {
        "/About" : (context) =>const AboutPage(),
        "/Setting" : (context) => const SettingPage(),
        "/search" : (context) => const searchPage(),
        "/detail" : (context) =>  customTableView(),
        "/verified" : (context) => const verifiedPage(),
        "/contact" : (context) => const contactPage(),
        "/login" : (context) => const LoginPage(),
      }

    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _menuListController = Get.put(Controller());
    final size = MediaQuery.of(context).size;
    double gridviewHeight = size.height * 0.250;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView builder'),
        actions: [IconButton(onPressed: (){
          Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        }, icon:const Icon(Icons.change_circle))],
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children:  [
          //     const Text('Developers', style: TextStyle(fontSize: 20),),
          //   SizedBox(
          //     width: size.width*0.03,
          //   ),
          //     const Icon(Icons.android, size: 32,),
          // ],),
          Obx(()=>AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: size.width,
            height: _menuListController.homeTab.value == 0 ? gridviewHeight : 0 ,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 70.0,
                childAspectRatio: 1.0,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,),
                padding: const EdgeInsets.all(10),
                itemCount: _menuListController.menuList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                 _menuListController.Gridindex.value =index;
                 final menu = _menuListController.menuList[index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(menu.route, arguments: menu.title);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.7), width: 1),
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26,width: 1),
                              shape: BoxShape.circle
                          ),
                          child: Icon(menu.icon,color: Colors.black26,size: 16,)
                      ),
                      const SizedBox(height: 5,),
                      Text(menu.title, style: const TextStyle(fontSize: 10.0)),
                    ],
                  ),
                ),
              );

                }),
          )),
          const Expanded(child: CustomTabBar())

        ],
      ),
    );
  }
}


