import 'package:flutter/material.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';


class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Text(
              'Документы',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Positioned(
              top: 20.0,
              right: 20.0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.figmaColorLight,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120.0),

                InkWell(
                  onTap: () {
                    // Добавьте здесь код для обработки нажатия на "Историю покупок"
                  },
                  child: Container(
                    width: 0.7 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Реквизиты',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Text(
                            'История покупок',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ]
                    )
                  ),
                ),

                SizedBox(height: 40.0),

                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 0.7 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Реквизиты',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text(
                          'История покупок',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ]
                    )
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
