import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';

class verifiedPage extends StatelessWidget {
  const verifiedPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final textValue = Get.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: Text(textValue),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Name'),
            const SizedBox(height: 20,),
            SizedBox(
              height: 120,
              child: ListView.builder(itemCount: 20,itemBuilder: (context, index) {
                return Text('Name $index');
              }),
            ),
            const SizedBox(height: 20,),
            const Text('Registration No'),
            const SizedBox(height: 20,),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.amber, width: 1)
                    ),
                    child: Center(child: Text('Registration_ID $index'))
                );

              }),
            ),
            
          ],
        ),
      ),
    );
  }
}
