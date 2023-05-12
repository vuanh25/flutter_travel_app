import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/usermodel.dart';
class HotelPorovider
{
  List<UserModel> UserModelList = [];

UserModel? userModel;
Future<void> getUserData() async {
  List<UserModel> newList = [];
  User? currentUser = FirebaseAuth.instance.currentUser;
  QuerySnapshot userSnapshot =
      await FirebaseFirestore.instance.collection("User").get();
  for (var element in userSnapshot.docs) {
      if (currentUser?.uid == (element.data() as Map<String, dynamic>)["UserId"]) {
        userModel = UserModel(
          userName: (element.data() as Map<String, dynamic>)["UserName"],
          userEmail: (element.data() as Map<String, dynamic>)["UserEmail"],
          userPhone: (element.data() as Map<String, dynamic>)["UserPhone"],
          userAddress: (element.data() as Map<String, dynamic>)["UserAddress"],
          userImage: (element.data() as Map<String, dynamic>)["UserImage"],
        );
        newList.add(userModel!);
      }
    }
   UserModelList = newList; 
}

List<UserModel> get getUserModelList
{
  return UserModelList;
}
}


