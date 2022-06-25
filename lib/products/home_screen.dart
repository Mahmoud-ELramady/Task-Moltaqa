import 'package:TaskMoltaqa/products/widget/custom_app_bar.dart';
import 'package:TaskMoltaqa/products/widget/custom_circleavatar.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'widget/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: whiteColor,
                    child: Icon(
                      Icons.apple,
                      size: 30,
                      color: blackColor,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: redColor,
                    child: Icon(
                      Icons.ac_unit_rounded,
                      color: whiteColor,
                      size: 23,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: whiteColor,
                    child: Icon(
                      Icons.currency_yen_outlined,
                      color: blackColor,
                      size: 23,
                    ),
                  ),
                  CustomCircleAvatar(
                      image: 'assets/svg/facebook_icon.svg',
                      color: Colors.white),
                  CustomCircleAvatar(
                      image: 'assets/svg/facebook_icon.svg',
                      color: Colors.white),
                  CustomCircleAvatar(
                      image: 'assets/svg/facebook_icon.svg',
                      color: Colors.lightBlue),
                ],
              ),
            ),
            const Expanded(child: ProductScreen())
          ],
          // image_lab_design
        ),
      ),
    );
  }
}
