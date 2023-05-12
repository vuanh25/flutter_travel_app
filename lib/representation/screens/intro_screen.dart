
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/model/appbaner.dart';
import 'package:flutter_travel_app/representation/screens/login_screen.dart';
import 'package:flutter_travel_app/representation/screens/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/banneritem.dart';
import '../../model/indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = '/intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _selected = 0;
  // Timer? _timer;
  // @override
  // void initState() {
  //   super.initState();
  //    _startTimer();
  // }

  // void _startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
  //     if (_selected == appBannerList.length - 1) {
  //       _selected = 0;
  //     } else {
  //       _selected++;
  //     }
  //     setState(() 
  //     {
        
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selected = index;
                  });
                },
                //   controller: PageController(viewportFraction: 0.9),
                itemCount: appBannerList.length,
                itemBuilder: (context, index) {
                  var banner = appBannerList[index];
                  var scale = _selected == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 350),
                    tween: Tween(begin: scale, end: scale),
                    curve: Curves.ease,
                    child: BannerItem(
                      appBanner: banner,
                    ),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appBannerList.length,
                    (index) => Indicator(
                          isActive: _selected == index ? true : false,
                        )),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Text(
                "Plan your trip",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Custom and fast planning with  a low price",
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colorpalette.buttonColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 160,
                  vertical: 15.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 120,
                  vertical: 15.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "Create account",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
