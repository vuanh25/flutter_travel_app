import 'package:flutter/material.dart';
import 'package:flutter_travel_app/data/model/hotel_model.dart';
import 'package:flutter_travel_app/representation/widgets/item_hotel_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/color_constants.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});
  static const routerName = "/listproduct_screen";

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final List<HotelModel> listHotel = [
    HotelModel(
        hotelImage: 'assets/images/hotel1.png',
        hotelName: 'Royal Palm Heritage',
        location: 'Purwokerto, Jateng',
        awayKilometer: '364 m',
        star: 4.5,
        numberOfReview: 3241,
        price: 143),
    HotelModel(
        hotelImage: 'assets/images/hotel2.png',
        hotelName: 'The Orlando House',
        location: 'Ajibarang, Jateng',
        awayKilometer: '1.1 km',
        star: 4.2,
        numberOfReview: 3241,
        price: 234),
    HotelModel(
        hotelImage: 'assets/images/hotel3.png',
        hotelName: 'The Orlando House',
        location: 'Ajibarang, Jateng',
        awayKilometer: '1.1 km',
        star: 3.8,
        numberOfReview: 1234,
        price: 132)
  ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: listHotel
            .map(
              (e) => ItemHoteWidget(
                hotelModel: e,
                onTap: () {},
              ),
            ).toList(),
      ),
      // body: ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Column(
      //         children: [
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           _buildListHotel(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
