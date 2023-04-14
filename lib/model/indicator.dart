import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: isActive ? 22.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: isActive ? Colorpalette.buttonColor : Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
    
  }
}