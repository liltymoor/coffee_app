import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';


class PaymentCardContainer extends StatelessWidget {
  static const height = 110.0;

  final cardName;
  final cardNumber;

  PaymentCardContainer({
    required this.cardName,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 0.9 * MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColor.figmaColorLight,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cardName,
                    style: TextStyle(
                      color: AppColor.figmaColorDark,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]
              ),

              InkWell(
                onTap: () {

                },

                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.figmaColorDark,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Text(
                    'Удалить',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              )
            ],
          ),

          Spacer(),

          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**** **** **** ',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  cardNumber,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}