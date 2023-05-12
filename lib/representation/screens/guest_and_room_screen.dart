import 'package:flutter/material.dart';
import '../../core/constants/color_constants.dart';
import '../widgets/item_change_guest_and_room.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountGuest =
      GlobalKey<ItemChangeGuestAndRoomState>();
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountRoom =
      GlobalKey<ItemChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add guest and room"),
      ),
      body: Column(children: [
        ItemChangeGuestAndRoom(
          key: _itemCountGuest,
          initData: 1,
          icon: "assets/icons/ico_guest.png",
          value: 'Guest',
        ),
        ItemChangeGuestAndRoom(
          key: _itemCountRoom,
          initData: 1,
          icon: "assets/icons/ico_room.png",
          value: 'Room',
        ),
        Material(
          color: Colorpalette.buttonColor,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
            borderRadius: BorderRadius.circular(30),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 150,
              ),
              child: Text("Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      ]),
    );
  }
}
