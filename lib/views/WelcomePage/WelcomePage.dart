import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/views/login/loginPage.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "w5.jpg",
    "w3.jpg",
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            itemCount: images.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/"+images[index]),
                fit: BoxFit.cover,
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 50,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(text: 'Trip', color: Colors.white, size: 35,),
                  const AppText(text: 'Mountains', color: Colors.black45, size: 20,),
                  const SizedBox(height: 10,),
                  const AppSmallText(text: 'The journey of a thousand\n miles begins with a single step.' , color: Colors.white, size: 14,),
                  const SizedBox(height: 20,),
                  ResponsiveButton(text: 'Welcome' , width: 140,
                      onPress: (){
                        print("1");
                        Get.to(const LoginPage());
                  }),

                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppText({Key? key, required this.size, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold
      ),
    );
  }
}
class AppSmallText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppSmallText({Key? key, required this.size, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
        color: color,
        fontSize: size,
    ),
    );
  }
}
class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String text;
  final Function onPress;
  const ResponsiveButton({Key? key,this.isResponsive=false,this.width, required this.text, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onPress,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text, style: const TextStyle(color: Colors.black, fontSize: 18),),
            Image.asset("images/buttonApp.png", color: Colors.white,),

        ],
        ),
      ),
    );
  }
}

