import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/Models/menu_model.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final textValue = Get.arguments.toString();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,elevation: 0.0,
            leading: IconButton(
                onPressed: ()=>Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.indigo)),
            title: Text(textValue, style: const TextStyle(color: Colors.black),),
            ),
      ),
    );
  }
}
