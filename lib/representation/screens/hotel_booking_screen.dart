import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/extensions/date_ext.dart';
import 'package:flutter_travel_app/representation/screens/select_date_screen.dart';
import '../../core/constants/color_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/item_options_booking.dart';
import 'guest_and_room_screen.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, this.destination});
  static const String routeName = '/hotel_booking_screen';
  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  String? guesAndRoom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hotel Booking'),
      ),
      body: Column(
        children: [
          ItemOptionsBookingWidget(
            title: 'Destonation',
            value: widget.destination ?? 'Viet Nam',
            icon: 'assets/icons/ico_location.png',
            onTap: () {},
          ),
          ItemOptionsBookingWidget(
            title: 'Select Date',
            value: selectDate ?? 'Select date',
            icon: 'assets/icons/ico_calendal.png',
            onTap: () async {
              final result = await Navigator.of(context)
                  .pushNamed(SelectDateScreen.routeName);
              if (result is List<DateTime?>) {
                setState(() {
                  selectDate =
                      '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                });
              }
            },
          ),
          ItemOptionsBookingWidget(
            title: 'Guest and Room',
            value: guesAndRoom ?? 'Guest and Room',
            icon: AssetHelper.icoBed,
            onTap: () async {
              final result = await Navigator.of(context)
                  .pushNamed(GuestAndRoomScreen.routeName);
              if (result is List<int>) {
                setState(() {
                  guesAndRoom = '${result[0]} Guest, ${result[1]} Room';
                });
              }
            },
          ),
          Material(
            color: Colorpalette.buttonColor,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('');
              },
              borderRadius: BorderRadius.circular(30),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 80,
                ),
                child: Text("Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
