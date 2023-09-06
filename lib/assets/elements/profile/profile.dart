import 'package:flutter/material.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Text(
              'Профиль',
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
                Container(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.figmaColorLight,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '+79876543210',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    // Добавьте здесь код для обработки нажатия на "Историю покупок"
                  },
                  child: Container(
                    width: 0.9 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'История покупок',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Выйти из аккаунта',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
