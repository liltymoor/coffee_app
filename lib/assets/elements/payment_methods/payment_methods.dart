import 'dart:ui';

import 'package:coffee_app/assets/constants/color_scheme.dart';
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
    // Добавьте свои карточки здесь
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
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Text(
              'Ваши способы оплаты',
              style: TextStyle(fontSize: 24.0),
            ),
          ),

          Positioned(
              top: 20.0,
              right: 20.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    // Добавьте здесь код для закрытия страницы профиля
                  },
                ),
              )
          ),

          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100.0),

                Container(
                  height: 3 * PaymentCardContainer.height + 32.0,
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    itemCount: cardData.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16.0);
                    },

                    itemBuilder: (BuildContext context, int index) {
                      return PaymentCardContainer(
                        cardName: cardData[index]["name"] ?? "",
                        cardNumber: cardData[index]["number"] ?? "",
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.0,),

                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
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

                SizedBox(height: 10.0,),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Возможные способы оплаты',
                    style: TextStyle(
                      color: AppColor.figmaColorDark,
                      fontSize: 16.0,
                    ),
                  ),
                ),

                SizedBox(height: 10.0,),

                Container(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      _buildColoredBox(
                          Colors.blue,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),
                      SizedBox(width: 10.0), // Добавляем пробел между прямоугольниками
                      _buildColoredBox(
                          Colors.red,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),
                      SizedBox(width: 10.0), // Добавляем пробел между прямоугольниками
                      _buildColoredBox(
                          Colors.green,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),
                      SizedBox(width: 10.0), // Добавляем пробел между прямоугольниками
                      _buildColoredBox(
                          Colors.yellow,
                          (0.9 * MediaQuery.of(context).size.width - 30.0) / 4
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
