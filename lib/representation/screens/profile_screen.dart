
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/model/usermodel.dart';
import 'package:flutter_travel_app/representation/widgets/mytextformgfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../provider/hotel_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
   static const routerName = "profile_screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;
  TextEditingController? phoneNumber;
  TextEditingController? address;
  TextEditingController? username;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HotelPorovider? hotelPorovider;
  void validation() async {
    if (username!.text.isEmpty && phoneNumber!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are empty")),
      );
    } else if (username!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Name Is Empty")),
      );
    } else if (username!.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Name Must Be 6")),
      );
    } else if (phoneNumber!.text.length < 10 || phoneNumber!.text.length > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone Number Must Be 10")),
      );
    } else {
      userDetailUpdate();
    }
  }

  File? _pickedImage;
  PickedFile? image;
  Future<void> getImage({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  Widget _buidSingleContainer({String? startext, String? endtext}) {
    return Container(
      decoration: const BoxDecoration(
        
          border: Border(
            
       // bottom: BorderSide(color: Colors.black26, width: 2.0),
      )),
      child: Card(
        shadowColor: Colorpalette.buttonColor,
        child: Container(
          height: 50,
          decoration: const BoxDecoration(),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  startext ?? '' ,
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  endtext ?? '',
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buidSingleTextFormFlied({String? name}) {
    return TextFormField(
      validator: (val) => val == "" ? "Name is empty" : null,
      decoration: InputDecoration(
        hintText: name,
      ),
    );
  }

  String? userUid;
    void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser?.uid;
  }
   Future<String> _uploadImage({required File image}) async {
    
    Reference storageReference =
    FirebaseStorage.instance.ref().child("UserImage/$userUid");
   
    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot snapshot =   uploadTask.snapshot;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }


  String? userImage;
  Widget _buildContainerPart() {
    address = TextEditingController(text: userModel?.userAddress);
    username = TextEditingController(text: userModel?.userName);
    phoneNumber = TextEditingController(text: userModel?.userPhone);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buidSingleContainer(endtext: userModel?.userName, startext: "Name"),
          _buidSingleContainer(
              endtext: userModel?.userEmail, startext: "Email"),
          _buidSingleContainer(
              endtext: userModel?.userPhone, startext: "Phone"),
          _buidSingleContainer(
              endtext: userModel?.userAddress, startext: "Address"),
        ],
      ),
    );
  }

  bool edit = false;
  bool centerCircle = false;
  var imageMap;
  void userDetailUpdate() async {
    setState(() {
      centerCircle = true;
    });
    _pickedImage != null
        ? imageMap =  await _uploadImage(image: _pickedImage!)
        : Container();
    FirebaseFirestore.instance.collection("User").doc(userUid).update({
      "UserName": username!.text,
      "UserPhone": phoneNumber!.text,
      "UserImage": imageMap,
      "UserAddress": address!.text,
    });
    setState(() {
      centerCircle = false;
    });
    setState(() {
      edit = false;
    });
  }

  Widget _buidTextFormFliedPart() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            name: "UserName",
            controller: username,
          ),
          _buidSingleContainer(
            endtext: userModel?.userEmail,
            startext: "Email",
          ),
          MyTextFormField(
            name: "PhoneNumber",
            controller: phoneNumber,
             
          ),
          MyTextFormField(
            name: "Address",
            controller: address,
           
          ),
        ],
      ),
    );
  }

  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Pick Form Camera"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Pick Form Gallery"),
                    onTap: () {
                       getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // hotelPorovider= Provider.of(context);
    getUserUid(); 
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: edit == true
            ? IconButton(
                icon: const Icon(FontAwesomeIcons.arrowLeft),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : Container(),
        backgroundColor: Colors.white,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          edit == false
              ? Container()
              : IconButton(
                  onPressed: () {
                    validation();
                  },
                  icon: const Icon(FontAwesomeIcons.check),
                  color: Colors.black,
                )
        ],
      ),
      body: centerCircle == false ?
      ListView(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("User").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var myDoc = snapshot.data?.docs;
              myDoc?.forEach((checkDocs) {
                  if (checkDocs.data()["UserId"] == userUid)
                  {
                     userModel = UserModel(
                      userName: checkDocs.data()["UserName"],
                      userEmail: checkDocs.data()["UserEmail"], 
                      userPhone: checkDocs.data()["UserPhone"], 
                      userAddress: checkDocs.data()["UserAddress"], 
                      userImage: checkDocs.data()["UserImage"]
                      );
                  }
               });
               return Container(
                height: 600,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                       CircleAvatar(
                      maxRadius: 60,
                              backgroundImage: _pickedImage == null
                                      ? userModel!.userImage == null
                                 ?  const AssetImage("assets/images/avartar.png") 
                                     : Image.network(userModel!.userImage as String).image
                                       : Image.file(_pickedImage!).image,
                                  )
                      ],
                    ),
                  ),
                  edit == true
                      ?  Padding(
                          padding: const EdgeInsets.only(left: 220, top: 90),
                          child: Card(
                            child: GestureDetector(
                              onTap: () {
                                myDialogBox(context);
                              },
                               child: const CircleAvatar(
                            backgroundColor: Colorpalette.buttonColor,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.photo_camera_outlined),
                          ),
                            ),
                          ),
                         
                        )
                      : Container(),
                ],
                    ),
                   SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container(
                          child: edit == true ? _buidTextFormFliedPart() : _buildContainerPart(),
                        ),
                        ),
                      ],
                    ),
                   ),
                    edit == false
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  edit = true;
                                });
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
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                  ],
                ),
               );
            },
          )
        ],
      ): const Center(
        child: CircularProgressIndicator(),
      ),
    
    );
  }
}
