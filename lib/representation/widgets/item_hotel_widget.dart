import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';

import '../../core/constants/color_constants.dart';
import '../../data/model/hotel_model.dart';

class ItemHoteWidget extends StatelessWidget {
  const ItemHoteWidget({super.key, required this.hotelModel, this.onTap});

  final HotelModel hotelModel;
  final Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: 18),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      'assets/icons/ico_location_blank.png',
                    ),
                    const SizedBox(width: 5,),
                    Text(hotelModel.location,),
                    Text(
                      '-${hotelModel.hotelName} from destination',
                      style:  const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        ImageHelper.loadFromAsset(
                          'assets/icons/ico_star.png',
                        ),
                        const SizedBox(width: 5,),
                        Text(hotelModel.star.toString(),),
                        Text(
                          '(${hotelModel.numberOfReview} reviews)',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                      
                    ),
                   // const DashLineWidget(),
                     Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '/night',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Material(
            color: Colorpalette.buttonColor,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(30),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 80,
                ),
                child: Text("Book a room",
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
                  ],
                )
              ],
            ),
            ),
        ],
      ),
    );
  }
}