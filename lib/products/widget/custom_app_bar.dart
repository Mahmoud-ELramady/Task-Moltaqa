import 'package:TaskMoltaqa/theme/style.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({
    Key? key,
  }) : super(
            key: key,
            preferredSize: const Size.fromHeight(70),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10, left: 12, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: greyColor,
                        size: 20,
                      ),
                      Text(
                        "Fashion",
                        style: redColorStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "123items",
                        style: colorStyleLight,
                      ),
                      const Spacer(),
                      const Icon(Icons.search),
                      const Icon(Icons.notifications_none),
                      const Icon(Icons.add_shopping_cart),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.add_road_outlined,
                        color: greyColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.compress_outlined, color: greyColor),
                      Spacer(),
                      Icon(Icons.menu, color: greyColor),
                    ],
                  )
                ],
              ),
            ));
}
