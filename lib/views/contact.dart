import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';

class contactPage extends StatelessWidget {
  const contactPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Controller _menuListController =(Get.find());

    final menu = _menuListController.menuList[_menuListController.Gridindex.value];

    return Scaffold(
      appBar: AppBar(title: Text(menu.title),),
    );
  }
}