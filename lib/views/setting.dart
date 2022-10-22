import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final _colorController = Get.put(Controller());

    final textValue = Get.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: Text(textValue),),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemCount: _colorController.colorsList.length,
                separatorBuilder: (BuildContext context,int index){
                  return const Divider(color: Colors.black26,);
                },
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: _colorController.colorsList[index].color!,
                          shape: BoxShape.circle
                      ),
                    ),
                    dense: true,
                    onTap: (){
                      Get.defaultDialog(
                        title: 'Alert!',
                        titleStyle:
                        const TextStyle(color: Colors.red),
                        middleText: 'Do you want to change theme?',
                        middleTextStyle: Theme.of(context).textTheme.bodyText1,
                        textCancel: 'Cancel',
                        //cancelTextColor: Colors.blue,
                        textConfirm: 'Confirm',
                        confirmTextColor: Colors.white,
                        onCancel: () {
                          Navigator.of(context).pop();
                         Get.to(SettingPage());

                        },
                        onConfirm: () async{
                          const CircularProgressIndicator();
                          setState(() {
                            Get.changeTheme(ThemeData(
                              appBarTheme: AppBarTheme(
                                elevation: 0.0,
                                backgroundColor: _colorController.colorsList[index].color!,
                              ),
                              primaryColor: _colorController.colorsList[index].color!,
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
                            ),);
                            _colorController.checkThemeColor.value = true;

                          });
                          // String stringColor = _colorController.colorsList[index].color!.toString();
                          // String valueString = stringColor.split('(0x')[1].split(')')[0]; // kind of hacky..
                          // int value = int.parse(valueString, radix: 16);
                          //int value = int.parse(_storeColorValue);
                          // final SharedPreferences prefs = await SharedPreferences.getInstance();
                          // prefs.setInt('ThemeColor', value);

                          Navigator.of(context).pop();
                          Get.to(const MyHomePage());

                        },
                      );

                    },

                    title: Text(_colorController.colorsList[index].colorName==null?"":_colorController.colorsList[index].colorName!,
                      style: Theme.of(context).textTheme.subtitle2,),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
