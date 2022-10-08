import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
class CustomProfile extends StatelessWidget {
  const CustomProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _profileListController = Get.put(Controller());
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
               margin: EdgeInsets.only(top: size.width * 0.02,),

              decoration:  const BoxDecoration(
                
                  //color: Theme.of(context).primaryColor.withOpacity(0.2),
                  borderRadius:   BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15) )),
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 80, 25, 80),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 1)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          //mainAxisExtent: 70.0,
                          childAspectRatio: 1.0,
                          //mainAxisSpacing: 8.0,
                          crossAxisSpacing: 4.0,
                    ),
                        padding: const EdgeInsets.all(10),
                        itemCount: _profileListController.profileItemList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          final profilemenu = _profileListController.profileItemList[index];
                          return Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(profilemenu.route);
                              },
                              color: Theme.of(context).primaryColor.withOpacity(0.7),
                              textColor: const Color(0xff34495E),
                              child:  Icon(profilemenu.icon, color: profilemenu.color,),
                              padding: const EdgeInsets.all(16),
                              shape: const CircleBorder(),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(profilemenu.title, style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(top: 35),
                decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15) ),

                ),
                width: size.width,
               // height: size.height * 25,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                     CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Theme.of(context).primaryColor,
                        backgroundImage: const AssetImage('images/person.png',)),

                     Text(
                      "Muhammad Javed", style: Theme.of(context).textTheme.headline6,
                    ),
                     Text("Android Developer", style: Theme.of(context).textTheme.subtitle2,)
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: size.blockSizeHorizontal * 11,
            //       vertical: size.blockSizeVertical * 3),
            //   child: FittedBox(
            //     child: Image.asset('assets/icon_trash2.png'),
            //     fit: BoxFit.fitWidth,
            //   ),
            //),


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: size.height * 22,
            //       width: size.width * 22,
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //               color: Colors.white,
            //               width: 2
            //           ),
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(
            //               10),
            //           image: const DecorationImage(
            //               image: AssetImage('images/Javed.png'),
            //               fit: BoxFit.fitWidth),
            //           boxShadow: const[
            //              BoxShadow(
            //                 color: Colors.black54,
            //                 blurRadius: 5.0,
            //                 offset: Offset(0, 2)),
            //           ]),
            //       margin:
            //       EdgeInsets.only(top: size.height * 20),
            //     ),
            //   ],
            // ),
          ],
        ));
  }
}
