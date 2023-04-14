import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        // background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white]),
          ),
        ),
        // body
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      
                      child: Row(
                        children: [
                          Image.asset('assets/icons/google.png',width: 33,height: 33,),
                          const SizedBox(width: 10,),
                          Text(
                            'Google',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 15),
                          ),
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/facebook.png',width: 33,height: 33,),
                          const SizedBox(width: 10,),
                          Text('Facebook',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 10,),
              Text('Or log in using',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),)
            ],
          ),
        ),
        AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: const Text('My App'),
          // centerTitle: true,
        ),
      ]

          // AppBar

          ),
    );
  }
}
