import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "w2.jpg",
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
              margin: const EdgeInsets.only(left: 20, top: 50,right: 20),
              child: Row(
                children: [
                  Column(
                    children: const [
                      AppText(text: 'Trip', color: Colors.white, size: 30,),
                      AppText(text: 'Mountains', color: Colors.black45, size: 20,),
                      SizedBox(height: 10,),
                      AppSmallText(text: 'The journey of a thousand\n miles begins with a single step.' , color: Colors.white, size: 14,),
                    ],
                  ),
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

