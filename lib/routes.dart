
import 'package:flutter/material.dart';

import 'package:flutter_travel_app/representation/screens/details_screen.dart';
import 'package:flutter_travel_app/representation/screens/guest_and_room_screen.dart';
import 'package:flutter_travel_app/representation/screens/homepage_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:flutter_travel_app/representation/screens/listproduct_screen.dart';
import 'package:flutter_travel_app/representation/screens/login_screen.dart';
import 'package:flutter_travel_app/representation/screens/select_date_screen.dart';

import 'package:flutter_travel_app/representation/screens/signup_screen.dart';

final Map<String, WidgetBuilder> routes = 
{
  IntroScreen.routeName:(context) => const IntroScreen(),
  LoginScreen.routeName:(context) => const LoginScreen(),
  SignUpScreen.routeName:(context) => const SignUpScreen(),
  HomePage.routerName:(context) => const HomePage(),
  ListProduct.routerName:(context)=> const ListProduct(),
  DetailsScreen.routeName:(context)=> const DetailsScreen(),
  HotelBookingScreen.routeName:(context)=> const HotelBookingScreen(),
  SelectDateScreen.routeName:(context) =>  SelectDateScreen(),
  GuestAndRoomScreen.routeName:(context) => const GuestAndRoomScreen(),
};