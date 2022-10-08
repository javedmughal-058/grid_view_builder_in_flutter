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
                  return Divider(color: Colors.black26,);
                },
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    dense: true,
                    onTap: (){
                      showDialog(context: context, builder: (builder){
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text("Change Theme"),
                          content: const Text("Are you sure? You want to change theme colors!",style: TextStyle(
                              color: Colors.black,fontSize: 14.0
                          )),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text('No')
                            ),
                            TextButton(
                                onPressed: () async {
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
                                  String _storeColorValue = _colorController.colorsList[index].color!.value.toString() ;
                                  int value = int.parse(_storeColorValue);
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setInt('ThemeColor', value);
                                  _colorController.checkThemeColor.value?
                                  Get.to(const MyHomePage()):
                                  Get.back();
                                },
                                child: Text('Yes',style: TextStyle(color: Colors.red),)
                            )
                          ],
                        );
                      });
                    },
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: _colorController.colorsList[index].color!,
                          shape: BoxShape.circle
                      ),
                    ),
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
