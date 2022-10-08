import 'package:flutter/material.dart';


class MenuModel{
  final String title;
  final Color color;
  final String route;
  final IconData icon;
  MenuModel({required this.title, required this.color, required this.route, required this.icon});

}

final menuList = [
  MenuModel(title: 'About us', color: Colors.amber, route: '/about', icon: Icons.info,  ),
  MenuModel(title: 'Setting', color: Colors.amber, route: '/setting', icon: Icons.settings,),
  MenuModel(title: 'Search', color: Colors.amber, route: '/search', icon: Icons.search,  ),
  MenuModel(title: 'Details', color: Colors.amber, route: '/detail', icon: Icons.details,  ),
  MenuModel(title: 'Verification', color: Colors.amber, route: '/verified', icon: Icons.verified,  ),
  MenuModel(title: 'Contact us', color: Colors.amber, route: '/contact', icon: Icons.call,  ),
];