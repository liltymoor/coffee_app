import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';


class PaymentCardContainer extends StatelessWidget {
  // static const height = adaptiveSize(context, 110.0);

  final cardName;
  final cardNumber;

  PaymentCardContainer({
    required this.cardName,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: adaptiveSize(context, 8.0)),
      child:Container(
        height: adaptiveSize(context, 110.0),
        width: 0.9 * MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: adaptiveSize(context, 16.0),
            vertical: adaptiveSize(context, 10.0),
        ),
        decoration: BoxDecoration(
          color: AppColor.figmaColorLight,
          borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
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
                        fontSize: adaptiveSize(context, 22.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
                ),

                InkWell(
                  onTap: () {

                  },

                  child: Container(
                    padding: EdgeInsets.all(adaptiveSize(context, 5.0)),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.figmaColorDark,
                        width: adaptiveSize(context, 1.5),
                      ),
                      borderRadius: BorderRadius.circular(adaptiveSize(context, 12.0)),
                    ),

                    child: Text(
                      'Удалить',
                      style: TextStyle(fontSize: adaptiveSize(context, 18.0)),
                    ),
                  )
                )
              ],
            ),

            Spacer(),

            Container(
              margin: EdgeInsets.only(top: adaptiveSize(context, 10.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '**** **** **** ',
                    style: TextStyle(
                      fontSize: adaptiveSize(context, 26.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    cardNumber,
                    style: TextStyle(fontSize: adaptiveSize(context, 18.0)),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}