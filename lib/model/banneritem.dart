 import 'package:flutter/material.dart';
 import 'appbaner.dart';

 class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const BannerItem({
    Key? key, required this.appBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(appBanner.thumbnailUrl),
            fit: BoxFit.cover),
      ),
    );
  }
}
