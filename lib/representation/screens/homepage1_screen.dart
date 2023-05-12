import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/model/usermodel.dart';
import 'package:flutter_travel_app/provider/hotel_provider.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helpers/image_helper.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

Widget _buildUserAccountsDraverHeader() {
  List<UserModel> userModel = HotelPorovider().UserModelList;
  return Column(
      children: userModel.map((e) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        e.userName!,
        style: const TextStyle(color: Colors.black),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: e.userImage == null
            ? const AssetImage('assets/images/avartar.png')
            : NetworkImage(e.userImage!) as ImageProvider,
      ),
      decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
      accountEmail: Text(
        e.userEmail!,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }).toList());
}

Widget _buildFeaturedProduct({required String name, required String image}) {
  return Card(
    child: SizedBox(
      height: 150,
      width: 180,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  "assets/images/$image",
                ),
              ),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w700),
          )
        ],
      ),
    ),
  );
}

Widget _buildCatogoryProduct({required String name, required String image}) {
  return Stack(
    children: [
      Container(
        height: 160,
        width: 300,
        //    color: Colors.black,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: AssetImage("assets/images/$image"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Text(
          name,
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    ],
  );
}

Widget _buildListHotel() {
  return Container(
    height: 134,
    decoration: BoxDecoration(
      //color: Colors.red,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.black26,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        Container(
          height: 134,
          width: 160,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/nhatrang.jpg"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
          child: Column(
            children: [
              Text(
                "Hotel Xuan Mai",
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Nha Trang - Khánh Hoà",
                style: GoogleFonts.roboto(
                    fontSize: 9, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colorpalette.buttonColor,
                        size: 15,
                      ),
                      Text(
                        "1.5 km",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      Text("\$ 9.999.999"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colorpalette.buttonColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colorpalette.buttonColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colorpalette.buttonColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colorpalette.buttonColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colorpalette.buttonColor,
                        size: 15,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget _buidItemCategory(Widget img,Color color,Function() onTap,String title)
{
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
          child: img,
          
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title),
      ],
    ),
  );
}
final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
List<UserModel> userModel = HotelPorovider().UserModelList;
bool homeColor = false;
bool mapColor = false;
bool aboutColor = false;
bool conTactUsColor = false;

class _HomePage1State extends State<HomePage1> {
  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "AnhVu",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 45,
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            accountEmail: Text(
              "vuanhpham25@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            selected: homeColor,
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              setState(() {
                homeColor = true;
                mapColor = false;
                aboutColor = false;
                conTactUsColor = false;
              });
            },
          ),
          ListTile(
            selected: mapColor,
            leading: const Icon(Icons.map_outlined),
            title: const Text("Map"),
            onTap: () {
              setState(() {
                mapColor = true;
                homeColor = false;
                aboutColor = false;
                conTactUsColor = false;
              });
            },
          ),
          ListTile(
            selected: aboutColor,
            leading: const Icon(Icons.info_outlined),
            title: const Text("About"),
            onTap: () {
              setState(() {
                aboutColor = true;
                homeColor = false;
                mapColor = false;
                conTactUsColor = false;
              });
            },
          ),
          ListTile(
            selected: conTactUsColor,
            leading: const Icon(Icons.phone_outlined),
            title: const Text("Contact us"),
            onTap: () {
              setState(() {
                conTactUsColor = true;
                homeColor = false;
                mapColor = false;
                aboutColor = false;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Log Out"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 30,
                color: Colors.black,
              )),
        ],
      ),
      body: SizedBox(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hi Anh Vu. Let's",
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Find your favorite Hotel",
                            style: GoogleFonts.poppins(
                                fontSize: 19, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        enabled: true,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          hintText: 'Search your destination',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.blueGrey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {},
                        onSubmitted: (String submitValue) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                      child: Row(
                        children: [
                          Expanded(child: _buidItemCategory(
                            ImageHelper.loadFromAsset(
                              
                              "assets/icons/ico_hotel.png",width: 18,height: 18
                            ),
                            const Color(0xffFE9C5E),
                            (){
                              Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                            },
                            'Hotels'
                          ),
                          ),
                          const SizedBox(width: 16,),
                          Expanded(child: _buidItemCategory(
                            ImageHelper.loadFromAsset(
                              
                              "assets/icons/ico_plane.png",width: 18,height: 18
                            ),
                            const Color(0xffF77777),
                            (){
                              
                            },
                            'Flights'
                            ),
                            ),
                          
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: <Widget>[
                                _buildFeaturedProduct(
                                    name: 'Nha Trang', image: 'nhatrang.jpg'),
                                _buildFeaturedProduct(
                                    name: 'Phú yên', image: 'phuyen.jpg'),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Hotel",
                        style: GoogleFonts.montserrat(
                            fontSize: 19, fontWeight: FontWeight.w700),
                      ),
                      const Text("Shee more"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      _buildCatogoryProduct(
                          name: 'Nha Trang', image: 'nhatrang.jpg'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Deals",
                        style: GoogleFonts.montserrat(
                            fontSize: 19, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Shee more",
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildListHotel(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildListHotel(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildListHotel(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildListHotel(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
