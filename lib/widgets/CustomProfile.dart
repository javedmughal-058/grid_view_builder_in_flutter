import 'package:flutter/material.dart';
class CustomProfile extends StatelessWidget {
  const CustomProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

        body: Stack(
          clipBehavior: Clip.none,

          children: [
            Container(
               margin: EdgeInsets.only(
                 top: size.width * 0.02,
              ),
              //padding: EdgeInsets.only(top: size.width * 10),
              //height: size.width * 10,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Colors.black54,
                  //     blurRadius: 3.0,
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: const Color(0xff34495E),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                            ),
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Works",
                            // style: GoogleFonts.roboto(
                            //     color: Color(0xff34495E),
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: const Color(0xff34495E),
                            child: const Icon(
                              Icons.map,
                              size: 50,
                            ),
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Map",
                            // style: GoogleFonts.roboto(
                            //     color: Color(0xff34495E),
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 15),
                          )
                        ],
                      ),

/*                      Icon(FontAwesomeIcons.truck),
                          Icon(FontAwesomeIcons.wallet),
                          Icon(FontAwesomeIcons.userAlt)*/
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children:  [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: const Color(0xff34495E),
                            child: const Icon(
                            Icons.wallet_giftcard,
                              size: 50,
                            ),
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Wallet",
                          //   style: GoogleFonts.roboto(
                          //       color: Color(0xff34495E),
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 15),
                          )
                        ]
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: const Color(0xff34495E),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                            ),
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Account",
                            // style: GoogleFonts.roboto(
                            //     color: Color(0xff34495E),
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 15),
                          )
                        ],
                      ),
/*                      Icon(FontAwesomeIcons.truck),
                          Icon(FontAwesomeIcons.wallet),
                          Icon(FontAwesomeIcons.userAlt)*/
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15) ),

                ),
                width: size.width,
               // height: size.height * 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    SizedBox(height: size.height*0.02,),
                    const Text(
                      "Muhammad Javed",
                      // style: GoogleFonts.roboto(
                      //     color: Color(0xffffffff),
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20),
                    ),
                    const Text("Android Developer",
                        // style: GoogleFonts.roboto(
                        //     fontSize: 15, color: Colors.white)
                    ),
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
