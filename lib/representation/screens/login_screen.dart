
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel_app/representation/screens/homepage_screen.dart';
import 'package:flutter_travel_app/representation/screens/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/color_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;
  var email;
  var password;

  void validation() async
  {
    final FormState form = formKey.currentState!;
    if (form.validate()) {
      try
      {
         UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
         print(result);
         Fluttertoast.showToast(msg: 'Đăng nhập thành công!');
         Navigator.of(context).pushNamed(HomePage.routerName);
       
     
      }
      on PlatformException catch(e)
      {
        print(e.toString());
      }
     
    } else {
    
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                              )),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/google.png',
                                width: 33,
                                height: 33,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
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
                              )),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/facebook.png',
                                width: 33,
                                height: 33,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Facebook',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Or log in using',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                    child: Column(
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                onChanged: (value) {
                                  email = value;
                                },
                                validator: (val) =>
                                    val == "" ? "Please write email" : null,
                                decoration: const InputDecoration(
                                  // custom border
                                  // color outline
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorpalette.buttonColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),

                                  // forcus boder
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorpalette.buttonColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  // disabled border
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorpalette.buttonColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),

                                  //hint Text
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colorpalette.buttonColor,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colorpalette.buttonColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => TextFormField(
                                  controller: passwordController,
                                  obscureText: isObsecure.value,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  validator: (val) => val == ""
                                      ? "Please write password"
                                      : null,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      color: Colorpalette.buttonColor,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.password,
                                      color: Colorpalette.buttonColor,
                                    ),
                                    suffixIcon: Obx(
                                      () => GestureDetector(
                                        onTap: () {
                                          isObsecure.value = !isObsecure.value;
                                        },
                                        child: Icon(
                                          isObsecure.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colorpalette.buttonColor,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                 
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Forgot Password?",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colorpalette.buttonColor,
                                borderRadius: BorderRadius.circular(30),
                                child: InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      validation();
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 150,
                                    ),
                                    child: Text("Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                             
                              Padding(
                                padding: const EdgeInsets.only(top: 250),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Dont have an account?",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        )),
                                        TextButton(
                                          onPressed: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                                          },
                                          child: Text("Sign Up",
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Colorpalette.buttonColor,
                                          )),
                                        ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // AppBar
    );
  }
}
