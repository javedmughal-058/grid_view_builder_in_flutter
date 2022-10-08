import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class CustomCurrencyWidget extends StatelessWidget {

  final Size size;
  final Controller userController;
  const CustomCurrencyWidget({Key? key,
    required this.size,required this.userController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => userController.showLiveCurrencyDialog.value?
    Card(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          html.Html(
            shrinkWrap: true,
            data: """<iframe src=https://www.widgets.investing.com/live-currency-cross-rates?theme=lightTheme&roundedCorners=true&pairs=1685,1786,2124,2180 width="100%" height="350" frameborder="0" allowtransparency="true" marginwidth="0" marginheight="0"></iframe>""",
          ),
          Positioned(
            top: -3,
            right: -2,
            child: GestureDetector(
              onTap: (){
                userController.showLiveCurrencyDialog.value = false;
                userController.saveCurrencyWidgetStatusToPreferences();
              },
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close,color: Colors.white70,size: 20,),
              ),
            ),
          ),
        ],
      ),
    ):
    const SizedBox()
    );
  }
}
