import 'package:flutter/material.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';


class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: adaptiveSize(context, 20.0)),

                Container(
                    width: 0.9 * MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          'Документы',
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

                SizedBox(height: adaptiveSize(context, 50.0)),

                InkWell(
                  onTap: () {
                    // Добавьте здесь код для обработки нажатия на "Историю покупок"
                  },
                  child: Container(
                    width: 0.7 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                    ),
                    padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Реквизиты',
                            style: TextStyle(fontSize: adaptiveSize(context, 24.0)),
                          ),
                          Text(
                            'История покупок',
                            style: TextStyle(fontSize: adaptiveSize(context, 24.0)),
                          ),
                        ]
                    )
                  ),
                ),

                SizedBox(height: adaptiveSize(context, 40.0)),

                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 0.7 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                    ),
                    padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Реквизиты',
                          style: TextStyle(fontSize: adaptiveSize(context, 24.0)),
                        ),
                        Text(
                          'История покупок',
                          style: TextStyle(fontSize: adaptiveSize(context, 24.0)),
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
