import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../theme/style.dart';
import '../../utils/app_colors.dart';
import 'custom_network_image.dart';

class ItemProduct extends StatefulWidget {
  final String? productName;
  final String? productImage;

  final String? brandProductName;
  final String? productSalePercentage;
  final String? productPrice;
  final dynamic productSalePrice;
  final String? productPriceSymbol;

  const ItemProduct(
      {this.productName,
      this.productImage,
      this.brandProductName,
      this.productSalePercentage,
      this.productPrice,
      this.productSalePrice,
      this.productPriceSymbol,
      Key? key})
      : super(key: key);

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomNetworkImage(
                  imageUrl: widget.productImage.toString(),
                  height: 110,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName.toString(),
                      style: colorStyleTitle,
                    ),
                    Text(
                      widget.brandProductName == null
                          ? ""
                          : widget.brandProductName.toString(),
                      style: colorStyleBrandName,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productSalePrice == null
                                  ? "${widget.productPrice} ${widget.productPriceSymbol}"
                                  : "${widget.productSalePrice} ${widget.productPriceSymbol}",
                              style: colorStylePrice,
                            ),
                            widget.productSalePrice == null
                                ? Container()
                                : Stack(
                                    children: [
                                      Text(
                                        "${widget.productPrice} ${widget.productPriceSymbol}",
                                        style: colorStyleSalePrice,
                                      ),
                                      const Positioned.fill(
                                        bottom: 2,
                                        child: Divider(
                                          thickness: 2,
                                          color: greyColor,
                                        ),
                                      )
                                    ],
                                  )
                          ],
                        ),
                        const CircleAvatar(
                          backgroundColor: redColor,
                          child: Icon(
                            Icons.shopping_cart,
                            color: whiteColor,
                            size: 23,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            )),
        Positioned(
            left: 15,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffBFE2FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.electric_bolt_outlined,
                      color: redColor,
                      size: 18,
                    ),
                    Text(widget.productSalePercentage.toString())
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
