import 'dart:ui';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';

import 'package:flutter/material.dart';
import 'payment_card_container.dart';

class PaymentMethodsPage extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {"name": 'Банковская карта 1', "number": '2354'},
    {"name": 'Банковская карта 2', "number": '3594'},
    {"name": 'Банковская карта 3', "number": '1546'},
    {"name": 'Банковская карта 4', "number": '7865'},
    {"name": 'Банковская карта 5', "number": '1289'},
    {"name": 'Банковская карта 6', "number": '3105'},
    {"name": 'Банковская карта 7', "number": '5742'},
    {"name": 'Банковская карта 8', "number": '0324'},
  ];

  Widget _buildColoredBox(Color color, double width) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: width,
      height: 40.0,
      // color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: adaptiveSize(context, 20.0)),

                Container(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Text(
                        'Ваши способы оплаты',
                        style: TextStyle(
                            fontSize: adaptiveSize(context, 26.0),
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Spacer(),

                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            // Добавьте здесь код для закрытия страницы профиля
                          },
                        ),
                      )
                    ],
                  )
                ),

                SizedBox(height: adaptiveSize(context, 30.0)),

                Container(
                  height: 3 * (adaptiveSize(context, 110.0) + adaptiveSize(context, 16.0)),
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: PageScrollPhysics(), // Добавлено для "постраничной" прокрутки
                    itemCount: cardData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PaymentCardContainer(
                        cardName: cardData[index]["name"] ?? "",
                        cardNumber: cardData[index]["number"] ?? "",
                      );
                    },
                  ),
                ),

                SizedBox(height: adaptiveSize(context, 20.0)),

                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: adaptiveSize(context, 30.0),
                    height: adaptiveSize(context, 30.0),
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: 3, // Увеличьте этот параметр, чтобы увеличить размер "+"
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 10.0,),
                Spacer(),

                Container(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Возможные способы оплаты',
                    style: TextStyle(
                      color: AppColor.figmaColorDark,
                      fontSize: adaptiveSize(context, 16.0),
                    ),
                  ),
                ),

                SizedBox(height: adaptiveSize(context, 10.0)),

                Container(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      _buildColoredBox(
                          Colors.blue,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),

                      Spacer(),

                      _buildColoredBox(
                          Colors.red,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),

                      Spacer(),

                      _buildColoredBox(
                          Colors.green,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),

                      Spacer(),

                      _buildColoredBox(
                          Colors.yellow,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),
                    ],
                  )
                ),

                SizedBox(height: adaptiveSize(context, 30.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
