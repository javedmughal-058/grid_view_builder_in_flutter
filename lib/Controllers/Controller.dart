import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Models/ColorChangeTheme.dart';
import 'package:grid_view_builder_in_flutter/Models/menu_model.dart';
import 'package:grid_view_builder_in_flutter/Models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController{


  late Controller menuListController;
  var Gridindex = 0.obs;
  var homeTab = 0.obs;
  var showLiveCurrencyDialog = true.obs;
  var checkThemeColor = false.obs;
  var showHead = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    menuListController = Controller();

  }

  final menuList = <MenuModel>[
    MenuModel(title: 'About us', color: Colors.amber, route: '/About', icon: Icons.info,  ),
    MenuModel(title: 'Setting', color: Colors.amber, route: '/Setting', icon: Icons.settings,),
    MenuModel(title: 'Search', color: Colors.amber, route: '/search', icon: Icons.search,  ),
    MenuModel(title: 'Details', color: Colors.amber, route: '/detail', icon: Icons.details,  ),
    MenuModel(title: 'Verification', color: Colors.amber, route: '/verified', icon: Icons.verified,  ),
    MenuModel(title: 'Contact us', color: Colors.amber, route: '/contact', icon: Icons.call,  ),
  ];

  final profileItemList = <ProfileModel>[
    ProfileModel(title: 'Works', color: Colors.white, route: '/About', icon: Icons.work,  ),
    ProfileModel(title: 'Map', color: Colors.white, route: '/Setting', icon: Icons.map,),
    ProfileModel(title: 'Wallet', color: Colors.white, route: '/search', icon: Icons.wallet_giftcard,  ),
    ProfileModel(title: 'Account', color: Colors.white, route: '/detail', icon: Icons.person,  ),
    ProfileModel(title: 'Setting', color: Colors.white, route: '/Setting', icon: Icons.settings,  ),

  ];

  final colorsList = <ColorChangeTheme>[
    ColorChangeTheme(color: Colors.red,colorName: "Red"),
    ColorChangeTheme(color: Colors.teal,colorName: "Teal"),
    ColorChangeTheme(color: Colors.black,colorName: "Full Black"),
    ColorChangeTheme(color: Colors.black26,colorName: "Half Black"),
    ColorChangeTheme(color: Colors.amber,colorName: "Yellow"),
    ColorChangeTheme(color: Colors.blue,colorName: "blue"),
    ColorChangeTheme(color: Colors.deepOrange,colorName: "Orange"),
    ColorChangeTheme(color: Colors.indigo,colorName: "Indigo")
  ];


  void saveCurrencyWidgetStatusToPreferences()async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('currencyWidget', showLiveCurrencyDialog.value);
  }

  void getCurrencyWidgetStatusToPreferences()async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    showLiveCurrencyDialog.value = _prefs.getBool('currencyWidget') ?? true;
  }

}