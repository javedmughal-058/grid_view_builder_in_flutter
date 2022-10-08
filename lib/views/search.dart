import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';

class searchPage extends StatelessWidget {
  const searchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final Controller _menuListController =(Get.find());

    final menu = _menuListController.menuList[_menuListController.Gridindex.value];

    return Scaffold(
      appBar: AppBar(title: Text(menu.title),),
    );
  }
  }

