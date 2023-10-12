import 'dart:math';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';

import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      color: AppColor.backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 0.9 * MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            'Профиль',
                            style: TextStyle(
                                fontSize: adaptiveSize(context, 26.0),
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Spacer(),

                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.figmaColorLight,
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
                    width: 0.9 * MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                    ),
                    padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                    child: Text(
                      '+79876543210',
                      style: TextStyle(
                        fontSize: adaptiveSize(context, 24.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: adaptiveSize(context, 20.0)),

                  InkWell(
                    onTap: () {
                      // Добавьте здесь код для обработки нажатия на "Историю покупок"
                    },
                    child: Container(
                      width: 0.9 * MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                      ),
                      padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                      child: Text(
                        'История покупок',
                        style: TextStyle(
                          fontSize: adaptiveSize(context, 24.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  Container(
                    width: 0.9 * MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                    ),
                    padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                    child: Column(
                        children: [
                          Container(
                            width: 0.9 * MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Text(
                              "Ваш личный код:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: adaptiveSize(context, 20.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          SizedBox(height: adaptiveSize(context, 20.0)),

                          Padding(
                            padding: EdgeInsets.only(
                              bottom: adaptiveSize(context, 5.0),
                              left: adaptiveSize(context, 5.0),
                            ),
                            child: QrImageView(
                              data: userCode,
                              version: QrVersions.auto,
                              size: adaptiveSize(context, 200.0),
                            ),
                            // child: Image.asset(
                            //   'lib/assets/images/qr.png',
                            //   width: adaptiveSize(context, 200.0),
                            //   height: adaptiveSize(context, 200.0),
                            // ),
                          ),

                          SizedBox(height: adaptiveSize(context, 20.0)),

                          Text(
                            userCode,
                            // "US123456",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: adaptiveSize(context, 24.0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]
                    ),
                  ),

                  Spacer(),

                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 0.8 * MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: adaptiveSize(context, 50.0),
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                      ),
                      child: Center(
                        child: Text(
                          'Выйти из аккаунта',
                          style: TextStyle(
                            fontSize: adaptiveSize(context, 24.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: adaptiveSize(context, 30.0)),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

// class ProfilePage extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: adaptiveSize(context, 20.0)),
//
//                 Container(
//                     width: 0.9 * MediaQuery.of(context).size.width,
//                     child: Row(
//                       children: [
//                         Text(
//                           'Профиль',
//                           style: TextStyle(
//                               fontSize: adaptiveSize(context, 26.0),
//                               fontWeight: FontWeight.w600
//                           ),
//                         ),
//
//                         Spacer(),
//
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFD9D9D9),
//                             borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
//                           ),
//                           child: IconButton(
//                             icon: Icon(Icons.close),
//                             onPressed: () {
//                               Navigator.of(context).pushReplacementNamed('/home');
//                             },
//                           ),
//                         )
//                       ],
//                     )
//                 ),
//
//                 SizedBox(height: adaptiveSize(context, 30.0)),
//
//                 Container(
//                   width: 0.9 * MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: AppColor.figmaColorLight,
//                     borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
//                   ),
//                   padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
//                   child: Text(
//                     '+79876543210',
//                     style: TextStyle(
//                       fontSize: adaptiveSize(context, 24.0),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: adaptiveSize(context, 20.0)),
//
//                 InkWell(
//                   onTap: () {
//                     // Добавьте здесь код для обработки нажатия на "Историю покупок"
//                   },
//                   child: Container(
//                     width: 0.9 * MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       color: AppColor.figmaColorLight,
//                       borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
//                     ),
//                     padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
//                     child: Text(
//                       'История покупок',
//                       style: TextStyle(
//                         fontSize: adaptiveSize(context, 24.0),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Spacer(),
//
//                 Container(
//                   width: 0.9 * MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: AppColor.figmaColorLight,
//                     borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
//                   ),
//                   padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 0.9 * MediaQuery.of(context).size.width,
//                         child: Text(
//                           "Ваш личный код:",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: adaptiveSize(context, 16.0),
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: adaptiveSize(context, 20.0)),
//
//                       Padding(
//                         padding: EdgeInsets.only(
//                             bottom: adaptiveSize(context, 5.0),
//                             left: adaptiveSize(context, 5.0),
//                         ),
//                         child: Image.asset(
//                           'lib/assets/images/qr.png',
//                           width: adaptiveSize(context, 200.0),
//                           height: adaptiveSize(context, 200.0),
//                         ),
//                       ),
//
//                       SizedBox(height: adaptiveSize(context, 20.0)),
//
//                       Text(
//                         "US123456",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: adaptiveSize(context, 24.0),
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ]
//                   ),
//                 ),
//
//                 Spacer(),
//
//                 InkWell(
//                   onTap: () {
//
//                   },
//                   child: Container(
//                     width: 0.8 * MediaQuery.of(context).size.width,
//                     height: adaptiveSize(context, 50.0),
//                     decoration: BoxDecoration(
//                       color: AppColor.figmaColorLight,
//                       borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Выйти из аккаунта',
//                         style: TextStyle(
//                           fontSize: adaptiveSize(context, 24.0),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: adaptiveSize(context, 30.0)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
