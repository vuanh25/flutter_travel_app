import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/screens/listproduct_screen.dart';
import 'package:flutter_travel_app/routes.dart';

import 'core/size_config.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Builder(
        builder: (context)
        {
          SizeConfig.init(context);
          return const ListProduct();
        },
      ),
    );
  }
}

