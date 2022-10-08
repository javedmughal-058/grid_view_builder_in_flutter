import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/menu_model.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Controller _menuListController =(Get.find());

    final menu = _menuListController.menuList[_menuListController.Gridindex.value];

    return Scaffold(
      appBar: AppBar(title: Text(menu.title),),
    );
  }
}
