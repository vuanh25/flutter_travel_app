import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class StarScreen extends StatelessWidget {
  const StarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Start Screen',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_star.png'),
                fit: BoxFit.cover),
          ),
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colorpalette.buttonColor,
                      width: 5.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/group.png',
                    width: 95,
                    height: 95,
                  ),
                ),
              ),
              Text(
                'My Hotel',
                style: GoogleFonts.ptSans(
                  fontSize: 46,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                'Welcome to My Hotel !',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                'Book easy and cheap hotels only My Hotel',
                 style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 400.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const IntroScreen()),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorpalette.buttonColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  "Let's Start",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
               Text(
                'Click to continue',
                 style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
