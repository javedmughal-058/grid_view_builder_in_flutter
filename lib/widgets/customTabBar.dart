import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/widgets/CustomCurrencyWidget.dart';
import 'package:grid_view_builder_in_flutter/widgets/CustomProfile.dart';
class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
  
  
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final Controller _tabController = Get.find();
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              controller: tabController,
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
                controller: tabController,
                children:  [
                  const Center(child: Text("Announcement"),),
                  CustomCurrencyWidget(size: size, userController: _tabController),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: size.width*0.78,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12,width: 1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TabBar(
                            indicatorColor: Colors.black,
                            labelColor: Theme.of(context).primaryColor,
                            labelStyle: const TextStyle(fontSize: 13.0),
                            unselectedLabelColor: Colors.black,
                            unselectedLabelStyle: const TextStyle(fontSize: 12.0),
                            tabs: const  [
                              Tab(text: 'Current',),
                              Tab(text: 'Syllabus',),
                              Tab(text: 'History',),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5.0,),
                        const Expanded(
                          child: TabBarView(
                            children: [
                              Center(child: Text('Current Books',)),
                              Center(child: Text('Syllabus for 9 , 10 ')),
                              Center(child: Text('History of records')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomProfile(),
                ],
              )
          )

        ],
      ),
    );
  }
}