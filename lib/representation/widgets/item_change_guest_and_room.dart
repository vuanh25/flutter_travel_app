import 'package:flutter/material.dart';


import '../../core/constants/dimension_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemChangeGuestAndRoom extends StatefulWidget {
  const ItemChangeGuestAndRoom({Key? key, this.initData = 0, required this.icon, required this.value})
      : super(key: key);

  final int initData;
  final String icon;
  final String value;

  @override
  State<ItemChangeGuestAndRoom> createState() => ItemChangeGuestAndRoomState();
}

class ItemChangeGuestAndRoomState extends State<ItemChangeGuestAndRoom> {
  late final TextEditingController _textEditingController;

  final FocusNode _focusNode = FocusNode();

  late int number;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initData.toString())
      ..addListener(() {
        number = int.parse(_textEditingController.text);
      });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(kTopPadding), color: Colors.white),
          margin: const EdgeInsets.only(bottom: kMediumPadding),
          padding: const EdgeInsets.all(kMediumPadding),
          child: Row(
            children: [
              ImageHelper.loadFromAsset(
                widget.icon,
              ),
              const SizedBox(
                width: kMediumPadding,
              ),
              Text(widget.value),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (number > 1) {
                    setState(() {
                      number--;
                      _textEditingController.text = number.toString();
                      if (_focusNode.hasFocus) {
                        _focusNode.unfocus();
                      }
                    });
                  }
                },
                child: ImageHelper.loadFromAsset(
                  AssetHelper.icoDecre,
                ),
              ),
              Container(
                height: 35,
                width: 60,
                padding: const EdgeInsets.only(left: 3),
                alignment: Alignment.center,
                child: TextField(
                  controller: _textEditingController,
                  textAlign: TextAlign.center,
                  focusNode: _focusNode,
                  enabled: true,
                  autocorrect: false,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      bottom: 18,
                    ),
                  ),
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    number++;
                    _textEditingController.text = number.toString();
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                  });
                },
                child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
              ),
            ],
          ),
        );
      },
    );
  }
}
