import 'dart:ui';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/assets/elements/payment_methods/payment_card_container.dart';


class BonusesPage extends StatelessWidget {
  final ValueNotifier<bool> isSwitchedNotifier = ValueNotifier<bool>(false);
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Text(
              'Бонусы',
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
            child: Container(
              width: 0.9 * MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 100.0),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: AppColor.figmaColorLight,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Доступно',
                                style: TextStyle(fontSize: 12.0,),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '400',
                                    style: TextStyle(
                                        fontSize: 34.0,
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                  // Image(image: AssetImage('lib/assets/star.png')),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.0), // Установите необходимое значение в пикселях
                                    child: Image.asset(
                                      'lib/assets/images/star.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '1 бонус = 1 ₽',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: AppColor.figmaColorDark
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.0,),

                  Container(
                    padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Введите промокод',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: AppColor.figmaColorDark,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0,),

                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: isSwitchedNotifier,
                          builder: (context, isSwitched, child) {
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                isSwitched ? 0 : 1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            }
                            double screenWidth = MediaQuery.of(context).size.width * 0.9 - 40;
                            double halfWidth = screenWidth / 2;

                            return Container(
                              width: screenWidth,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColor.figmaColorDark,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Stack(
                                children: [
                                  AnimatedPositioned(
                                    duration: Duration(milliseconds: 200),
                                    left: isSwitched ? 0 : halfWidth,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: halfWidth,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColor.figmaColorLight,
                                        borderRadius: BorderRadius.circular(25.0),
                                        border: Border.all(
                                          color: AppColor.figmaColorDark,
                                          width: 2.0,
                                        )
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isSwitchedNotifier.value = true;
                                        },
                                        child: Container(
                                          width: halfWidth,
                                          height: 50,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text("Отправь"),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          isSwitchedNotifier.value = false;
                                        },
                                        child: Container(
                                          width: halfWidth,
                                          height: 50,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text("Покажи"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 20.0,),

                        Container(
                          height: 200,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              // Обновить ValueNotifier при изменении страницы
                              isSwitchedNotifier.value = (index == 0);
                            },
                            children: [
                              Container(
                                color: Colors.orange,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Делись бонусами и получай скидки",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ),
                                      Text("Первый контейнер"),
                                      Text("Первый контейнер"),
                                    ],
                                  )
                                ),
                              ),
                              Container(
                                color: Colors.green,
                                child: Center(
                                    child: Column(
                                      children: [
                                        Text("Первый контейнер"),
                                        Text("Первый контейнер"),
                                        Text("Первый контейнер"),
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
