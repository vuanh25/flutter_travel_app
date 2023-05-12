import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel_app/representation/screens/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/color_constants.dart';


class SignUpScreen extends StatefulWidget {
  
  const SignUpScreen({super.key});
  static String routeName = '/sigup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var isObsecure = true.obs;
  var email="";
  var password="";
  var userName="";
  var phoneNumber="";
 
 
  void validation() async 
  {
    
    final FormState form = formKey.currentState! ;  
    if (form.validate())
    {
      try
      {
         UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
         FirebaseFirestore.instance.collection("User").doc(result.user?.uid).set({
          "UserName": userName,
          "UserId": result.user?.uid,
          "UserEmail": email,
          "PhoneNumber": phoneNumber,
          
         });
         Fluttertoast.showToast(msg: 'Đăng ký thành công!');
         Navigator.of(context).pushNamed(LoginScreen.routeName);
      }
      on PlatformException catch(e)
      {
        print(e.message.toString());
        Fluttertoast.showToast(msg: 'Tài khoản đã tồn tại!');
      }

     
    }
    else
    {
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
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
                      "Sign Up",
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
                    'Or Sign Up using',
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
                                controller: usernameController,
                                onChanged: (value) {
                                  setState(() {
                                     userName=value;
                                  });
                                 
                                },
                                validator: (val) =>
                                    val == "" ? "Please write username" : null,
                                decoration: const InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                      color: Colorpalette.buttonColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colorpalette.buttonColor,
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                onChanged: (value)
                                {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: (value) {
                                  if (value != null || value!.isNotEmpty) {
                                    final RegExp regex = RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                    if (!regex.hasMatch(value)) {
                                      return 'Enter a valid email';
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return 'Enter a valid email';
                                  }
                                },
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
                              TextFormField(
                                controller: phoneController,
                                onChanged: ((value) {
                                  setState(() {
                                    phoneNumber=value;
                                  });
                                }),
                                validator: ((value) => value == ""
                                    ? "Please write phone number"
                                    : null),
                                decoration: const InputDecoration(
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      color: Colorpalette.buttonColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorpalette.buttonColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colorpalette.buttonColor,
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => TextFormField(
                                  controller: passwordController,
                                  obscureText: isObsecure.value,
                                  onChanged: ((value) {
                                    setState(() {
                                      password = value;
                                    });
                                  }),
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
                                    validation();
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 150,
                                    ),
                                    child: Text("Sign up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account?",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        )),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()),
                                        );
                                      },
                                      child: Text("Sign in",
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
    );
  }
}
