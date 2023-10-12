import 'dart:ui';
import 'dart:math';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';

import 'package:flutter/material.dart';


class BonusesPage extends StatefulWidget {
  @override
  _BunusesPageState createState() => _BunusesPageState();
}

class _BunusesPageState extends State<BonusesPage> {
  final ValueNotifier<bool> isSwitchedNotifier = ValueNotifier<bool>(true);
  final PageController _pageController = PageController();

  String userCode = "US123456"; // Изначальное значение

  @override
  void initState() {
    super.initState();
    generateNewCode();
  }

  void generateNewCode() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    final random = Random();
    final randomLetters =
        letters[random.nextInt(letters.length)] +
        letters[random.nextInt(letters.length)];
    final randomNumber = random.nextInt(900000) + 100000;

    setState(() {
      userCode = "$randomLetters$randomNumber";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: adaptiveSize(context, 20.0),
        right: adaptiveSize(context, 20.0),
        top: adaptiveSize(context, 50.0)
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                width: 0.9 * MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                        width: 0.9 * MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Text(
                              'Бонусы',
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
                                  Navigator.of(context).pushReplacementNamed('/home');
                                },
                              ),
                            )
                          ],
                        )
                    ),

                    SizedBox(height: adaptiveSize(context, 30.0)),

                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                            decoration: BoxDecoration(
                              color: AppColor.figmaColorLight,
                              borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Доступно',
                                  style: TextStyle(
                                      fontSize: adaptiveSize(context, 12.0),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '400',
                                      style: TextStyle(
                                          fontSize: adaptiveSize(context, 34.0),
                                          fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: adaptiveSize(context, 5.0)),
                                      child: Image.asset(
                                        'lib/assets/images/star.png',
                                        width: adaptiveSize(context, 30.0),
                                        height: adaptiveSize(context, 30.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '1 бонус = 1 ₽',
                                  style: TextStyle(
                                      fontSize: adaptiveSize(context, 12.0),
                                      fontWeight: FontWeight.w600,
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

                    SizedBox(height: adaptiveSize(context, 20.0)),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: adaptiveSize(context, 18.0),
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Введите промокод',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: adaptiveSize(context, 18.0),
                            fontWeight: FontWeight.w600,
                            color: AppColor.figmaColorDark,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: adaptiveSize(context, 20.0)),

                    Container(
                      padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
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
                              double screenWidth = MediaQuery.of(context).size.width * 0.9 - adaptiveSize(context, 40.0);
                              double halfWidth = screenWidth / 2;

                              return Container(
                                width: screenWidth,
                                height: adaptiveSize(context, 50.0),
                                decoration: BoxDecoration(
                                  color: AppColor.figmaColorDark,
                                  borderRadius: BorderRadius.circular(adaptiveSize(context, 25.0)),
                                ),
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 200),
                                      left: isSwitched ? 0 : halfWidth,
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: halfWidth,
                                        height: adaptiveSize(context, 50.0),
                                        decoration: BoxDecoration(
                                            color: AppColor.figmaColorLight,
                                            borderRadius: BorderRadius.circular(adaptiveSize(context, 25.0)),
                                            border: Border.all(
                                              color: AppColor.figmaColorDark,
                                              width: adaptiveSize(context, 2.0),
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
                                            height: adaptiveSize(context, 50.0),
                                            color: Colors.transparent,
                                            child: Center(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(right: adaptiveSize(context, 5.0)),
                                                        child: Image.asset(
                                                          'lib/assets/images/share.png',
                                                          width: adaptiveSize(context, 20.0),
                                                          height: adaptiveSize(context, 20.0),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Отправь",
                                                        style: TextStyle(
                                                            fontSize: adaptiveSize(context, 17.0),
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            isSwitchedNotifier.value = false;
                                          },
                                          child: Container(
                                            width: halfWidth,
                                            height: adaptiveSize(context, 50.0),
                                            color: Colors.transparent,
                                            child: Center(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(right: adaptiveSize(context, 5.0)),
                                                        child: Image.asset(
                                                          'lib/assets/images/eye.png',
                                                          width: adaptiveSize(context, 20.0),
                                                          height: adaptiveSize(context, 20.0),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Покажи",
                                                        style: TextStyle(
                                                            fontSize: adaptiveSize(context, 17.0),
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ]
                                                )
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

                          SizedBox(height: adaptiveSize(context, 20.0)),

                          Container(
                            height: adaptiveSize(context, 200.0),
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                // Обновить ValueNotifier при изменении страницы
                                isSwitchedNotifier.value = (index == 0);
                              },
                              children: [
                                Container(
                                    color: AppColor.figmaColorLight,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Делись бонусами и получай скидки",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: adaptiveSize(context, 17.0),
                                            fontWeight: FontWeight.w700,

                                          ),
                                        ),
                                        Text(
                                          "Отправь промокод другу - он получит 100 бонусов. "
                                              "Когда друго потратит первые 100 ₽, ты получишь 100 бонусов на счет",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: adaptiveSize(context, 13.0),
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.figmaColorDark,
                                          ),
                                        ),

                                        SizedBox(height: adaptiveSize(context, 20.0)),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              userCode,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: adaptiveSize(context, 24.0),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: adaptiveSize(context, 5.0)
                                              ),
                                              child: Image.asset(
                                                'lib/assets/images/copy.png',
                                                width: adaptiveSize(context, 30.0),
                                                height: adaptiveSize(context, 30.0),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Spacer(),

                                        InkWell(
                                          onTap: () {

                                          },
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.9 - adaptiveSize(context, 40.0),
                                            height: adaptiveSize(context, 50.0),
                                            decoration: BoxDecoration(
                                              color: AppColor.figmaColorMid,
                                              borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Поделиться',
                                                style: TextStyle(
                                                  fontSize: adaptiveSize(context, 17.0),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                Container(
                                  color: AppColor.figmaColorLight,
                                  child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Покажи промокод в виде QR-кода",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: adaptiveSize(context, 17.0),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),

                                          Spacer(),

                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: adaptiveSize(context, 5.0),
                                                left: adaptiveSize(context, 5.0)
                                            ),
                                            child: QrImageView(
                                              data: userCode,
                                              version: QrVersions.auto,
                                              size: adaptiveSize(context, 150.0),
                                            ),
                                          ),
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
      )
    );
  }
}


