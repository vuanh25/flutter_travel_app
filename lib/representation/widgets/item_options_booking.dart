import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/widgets/textstyle_ext.dart';

import '../../core/helpers/image_helper.dart';


class ItemOptionsBookingWidget extends StatelessWidget {
  const ItemOptionsBookingWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(bottom: 24.0),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              icon,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.fontCaption,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  value,
                  style: TextStyles.defaultStyle.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
