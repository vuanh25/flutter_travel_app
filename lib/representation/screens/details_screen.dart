import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = '/details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colorpalette.buttonColor,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 215,
                  width: 354,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mandarin \nOriental",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "\$499",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Bang Rak, Bangkok 10500, Thailand",
                                  style: GoogleFonts.roboto(
                                      fontSize: 9, color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.location_on_outlined,
                                    color: Colorpalette.buttonColor,
                                  ),
                                ),
                                Text(
                                  "(759mm) 48 Oriental Ave)",
                                  style: GoogleFonts.roboto(
                                      fontSize: 9, color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
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
                                  color: Colors.white12,
                                  size: 15,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Material(
                                    color: Colorpalette.buttonColor,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () {
                                       
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 80,
                                        ),
                                        child: Text("Reserve Room",
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
                        ),
                      ),
                    ),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                      Text("Show more",style: GoogleFonts.roboto(fontSize: 14,color: Colors.white),),
                     IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down,color: Colors.white, size: 20,)),
                   ],
                 ),
                 const SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
