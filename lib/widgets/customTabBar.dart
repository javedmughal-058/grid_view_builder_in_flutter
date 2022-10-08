import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller _tabController = Get.find();
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 4,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  // color: Colors.grey[300],
                    border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(25.0)
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      borderRadius:  BorderRadius.circular(25.0)
                  ) ,
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(fontSize: 13.0),
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  unselectedLabelStyle: const TextStyle(fontSize: 12.0),
                  onTap: (index){
                    _tabController.homeTab.value = index;
                  },
                  tabs: const  [
                    Tab(
                      // text: 'Announcement',
                        icon: Icon(Icons.announcement,size: 20,)),
                    Tab(
                      // text: 'Forex',
                        icon: Icon(Icons.trending_down,size: 20,)),
                    Tab(
                      // text: 'Appointments',
                        icon: Icon(Icons.request_page,size: 20,)),
                    Tab(
                        icon: Icon(Icons.person,size: 20,))
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                    children:  [
                      const Center(child: Text("Announcement"),),
                      CustomCurrencyWidget(size: size, userController: _tabController),
                      const Center(child: Text("Appointments"),),
                      const Center(child: Text("Profile"),),
                    ],
                  )
              )

            ],
          ),
        )
    );
  }
}