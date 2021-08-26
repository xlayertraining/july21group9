import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/Homepage.dart';

import 'package:untitled2/sign_in_page.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
class SplashScreen extends StatelessWidget {

// class SplashScreen extends EasyLoadingAnimation {
//   CustomAnimation();
//   @override
//   Widget buildWidget(Widget child,
//       AnimationController controller,
//       AlignmentGeometry alignment) {
//     return Opacity(
//       opacity: controller.value,
//       child: RotationTransition(
//         turns: controller,
//         child: child,
//       ),
//     );
//     // TODO: implement buildWidget
//     throw UnimplementedError();
//   }
//
// }


  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
      initTimer();
    }
    // EasyLoading.instance
    //   ..displayDuration = const Duration(milliseconds: 2000)
    //   ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    //   ..loadingStyle = EasyLoadingStyle.dark
    //   ..indicatorSize = 45.0
    //   ..radius = 10.0
    //   ..progressColor = Colors.yellow
    //   ..backgroundColor = Colors.green
    //   ..indicatorColor = Colors.yellow
    //   ..textColor = Colors.yellow
    //   ..maskColor = Colors.blue.withOpacity(0.5)
    //   ..userInteractions = true
    //   ..dismissOnTap = false
    //   ..customAnimation = SplashScreen() as EasyLoadingAnimation?;
    return Scaffold(
      body: Container(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(

                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.2,
                    0.5,
                    0.8,
                    0.7
                  ],
                  colors: [
                    Colors.purple.shade50,
                    Colors.deepPurple.shade100,
                    Colors.deepPurple.shade200,
                    Colors.deepPurple.shade300,
                  ]
              )
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/News Flix.png",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),


              Text("NEWS FLIX",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 15.0,),
              Text(
                "Unfolding The Truth",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var signedInValue = await prefs.getString(Configuration.signedInKey);
    print(signedInValue);
    if (signedInValue == null) {
      Timer(Duration(seconds: 3), () {
        Navigator.of(_context!).pushReplacement(
            MaterialPageRoute(builder: (context) => Myapp())
        );
      }
      );
    } else {
      Configuration.authToken = signedInValue;
      Timer(Duration(seconds: 3), () {
        Navigator.of(_context!).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );
      }
      );
    }
  }
}