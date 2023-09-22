import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';

enum SwitchState { subStatus_1, subStatus_2, subStatus_3 }

final userSubStatusList = [SwitchState.subStatus_1, SwitchState.subStatus_2, SwitchState.subStatus_1];


Widget buildButtonItem(BuildContext context, String label, VoidCallback onTap) {
  double screenWidth = MediaQuery.of(context).size.width * 0.8 - adaptiveSize(context, 40.0);
  double thirdWidth = screenWidth / 3;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: thirdWidth,
      height: adaptiveSize(context, 40.0),
      color: Colors.transparent,
      child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      fontSize: adaptiveSize(context, 17.0),
                      fontWeight: FontWeight.w700
                  ),
                ),
              ]
          )
      ),
    ),
  );
}


List<Widget> buildSubscribeContainers(
    BuildContext context,
    List<List<String>> containerValuesFirst,
    List<List<String>> containerValuesSecond,
    List<List<String>> containerValuesThird) {
  final positionNotifierFirst = ValueNotifier<SwitchState>(userSubStatusList[0]);
  final positionNotifierSecond = ValueNotifier<SwitchState>(userSubStatusList[1]);
  final positionNotifierThird = ValueNotifier<SwitchState>(userSubStatusList[2]);

  return  [
    Container(
        width: 0.8 * MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
        decoration: BoxDecoration(
            color: AppColor.figmaColorLight,
            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  child: Text(
                    containerValuesFirst[0][0],
                    style: TextStyle(
                        fontSize: adaptiveSize(context, 24.0),
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),

                Spacer(),

                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          containerValuesFirst[1][0],
                          style: TextStyle(
                            fontSize: adaptiveSize(context, 16.0),
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        Text(
                          containerValuesFirst[1][1],
                          style: TextStyle(
                              fontSize: adaptiveSize(context, 14.0),
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),

            SizedBox(height: adaptiveSize(context, 10.0)),

            ValueListenableBuilder<SwitchState>(
              valueListenable: positionNotifierFirst,
              builder: (context, currentState, child) {
                double screenWidth = MediaQuery.of(context).size.width * 0.8 - adaptiveSize(context, 40.0);
                double thirdWidth = screenWidth / 3;

                // На основе currentState определите позицию для AnimatedPositioned
                double leftPosition;
                switch (currentState) {
                  case SwitchState.subStatus_1:
                    leftPosition = 0;
                    break;
                  case SwitchState.subStatus_2:
                    leftPosition = thirdWidth;
                    break;
                  case SwitchState.subStatus_3:
                    leftPosition = 2 * thirdWidth;
                    break;
                }

                return Container(
                  width: screenWidth,
                  height: adaptiveSize(context, 40.0),
                  decoration: BoxDecoration(
                    color: AppColor.figmaColorDark,
                    borderRadius: BorderRadius.circular(adaptiveSize(context, 20.0)),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        left: leftPosition,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: thirdWidth,
                          height: adaptiveSize(context, 40.0),
                          decoration: BoxDecoration(
                              color: AppColor.figmaColorLight,
                              borderRadius: BorderRadius.circular(adaptiveSize(context, 20.0)),
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
                          buildButtonItem(
                              context,
                              containerValuesFirst[2][0],
                                  () => positionNotifierFirst.value = SwitchState.subStatus_1
                          ),
                          buildButtonItem(
                              context,
                              containerValuesFirst[2][1],
                                  () => positionNotifierFirst.value = SwitchState.subStatus_2
                          ),
                          buildButtonItem(
                              context,
                              containerValuesFirst[2][2],
                                  () => positionNotifierFirst.value = SwitchState.subStatus_3
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

          ],
        )
    ),

    Container(
        width: 0.8 * MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
        decoration: BoxDecoration(
            color: AppColor.figmaColorLight,
            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  child: Text(
                    containerValuesSecond[0][0],
                    style: TextStyle(
                        fontSize: adaptiveSize(context, 24.0),
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),

                Spacer(),

                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          containerValuesSecond[1][0],
                          style: TextStyle(
                            fontSize: adaptiveSize(context, 16.0),
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        Text(
                          containerValuesSecond[1][1],
                          style: TextStyle(
                              fontSize: adaptiveSize(context, 14.0),
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),

            SizedBox(height: adaptiveSize(context, 10.0)),

            ValueListenableBuilder<SwitchState>(
              valueListenable: positionNotifierSecond,
              builder: (context, currentState, child) {
                double screenWidth = MediaQuery.of(context).size.width * 0.8 - adaptiveSize(context, 40.0);
                double thirdWidth = screenWidth / 3;

                // На основе currentState определите позицию для AnimatedPositioned
                double leftPosition;
                switch (currentState) {
                  case SwitchState.subStatus_1:
                    leftPosition = 0;
                    break;
                  case SwitchState.subStatus_2:
                    leftPosition = thirdWidth;
                    break;
                  case SwitchState.subStatus_3:
                    leftPosition = 2 * thirdWidth;
                    break;
                }

                return Container(
                  width: screenWidth,
                  height: adaptiveSize(context, 40.0),
                  decoration: BoxDecoration(
                    color: AppColor.figmaColorDark,
                    borderRadius: BorderRadius.circular(adaptiveSize(context, 20.0)),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        left: leftPosition,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: thirdWidth,
                          height: adaptiveSize(context, 40.0),
                          decoration: BoxDecoration(
                              color: AppColor.figmaColorLight,
                              borderRadius: BorderRadius.circular(adaptiveSize(context, 20.0)),
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
                          buildButtonItem(
                              context,
                              containerValuesSecond[2][0],
                                  () => positionNotifierSecond.value = SwitchState.subStatus_1
                          ),
                          buildButtonItem(
                              context,
                              containerValuesSecond[2][1],
                                  () => positionNotifierSecond.value = SwitchState.subStatus_2
                          ),
                          buildButtonItem(
                              context,
                              containerValuesSecond[2][2],
                                  () => positionNotifierSecond.value = SwitchState.subStatus_3
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )
    ),

    Container(
        width: 0.8 * MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
        decoration: BoxDecoration(
            color: AppColor.figmaColorLight,
            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  child: Text(
                    containerValuesThird[0][0],
                    style: TextStyle(
                        fontSize: adaptiveSize(context, 24.0),
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),

                Spacer(),

                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          containerValuesThird[1][0],
                          style: TextStyle(
                            fontSize: adaptiveSize(context, 16.0),
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        Text(
                          containerValuesThird[1][1],
                          style: TextStyle(
                              fontSize: adaptiveSize(context, 14.0),
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),

            SizedBox(height: adaptiveSize(context, 10.0)),

            ValueListenableBuilder<SwitchState>(
              valueListenable: positionNotifierThird,
              builder: (context, currentState, child) {
                double screenWidth = MediaQuery.of(context).size.width * 0.8 - adaptiveSize(context, 40.0);
                double thirdWidth = screenWidth / 3;

                // На основе currentState определите позицию для AnimatedPositioned
                double leftPosition;
                switch (currentState) {
                  case SwitchState.subStatus_1:
                    leftPosition = 0;
                    break;
                  case SwitchState.subStatus_2:
                    leftPosition = thirdWidth;
                    break;
                  case SwitchState.subStatus_3:
                    leftPosition = 2 * thirdWidth;
                    break;
                }

                return Container(
                  width: screenWidth,
                  height: adaptiveSize(context, 40.0),
                  decoration: BoxDecoration(
                    color: AppColor.figmaColorDark,
                    borderRadius: BorderRadius.circular(adaptiveSize(context, 20.0)),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        left: leftPosition,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: thirdWidth,
                          height: adaptiveSize(context, 40.0),
                          decoration: BoxDecoration(
                              color: AppColor.figmaColorLight,
                              borderRadius: BorderRadius.circular(adaptiveSize(context, 20.0)),
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
                          buildButtonItem(
                              context,
                              containerValuesThird[2][0],
                                  () => positionNotifierThird.value = SwitchState.subStatus_1
                          ),
                          buildButtonItem(
                              context,
                              containerValuesThird[2][1],
                                  () => positionNotifierThird.value = SwitchState.subStatus_2
                          ),
                          buildButtonItem(
                              context,
                              containerValuesThird[2][2],
                                  () => positionNotifierThird.value = SwitchState.subStatus_3
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )
    ),
  ];
}


class SubscribePage extends StatelessWidget {
  final ValueNotifier<bool> isSwitchedNotifier = ValueNotifier<bool>(true);

  final positionNotifierFirst = ValueNotifier<SwitchState>(userSubStatusList[0]);
  final positionNotifierSecond = ValueNotifier<SwitchState>(userSubStatusList[1]);
  final positionNotifierThird = ValueNotifier<SwitchState>(userSubStatusList[2]);

  final userSubList = [...[1, 2, 3]..sort()].reversed.toList();
  // final userSubList = [...[1, 3]..sort()].reversed.toList();
  // final userSubList = [...[2]..sort()].reversed.toList();
  // final userSubList = [...[]..sort()].reversed.toList();

  @override
  Widget build(BuildContext context) {
    List<Widget> subscribeContainers = buildSubscribeContainers(
      context,
      [["Уровень 1"], ["700 рублей", ""], ["7 дней", "14 дней", "1 месяц"]],
      [["Уровень 2"], ["В заморозке", "осталось 4 дня"], ["7 дней", "14 дней", "1 месяц"]],
      [["Уровень 3"], ["Действует до:", "31.10.2023"], ["7 дней", "14 дней", "1 месяц"]],
    );

    Map<int, Widget>subscribeContainersDict = {
      1: subscribeContainers[0],
      2: subscribeContainers[1],
      3: subscribeContainers[2],
    };

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: adaptiveSize(context, 20.0)),

                Container(
                    width: 0.9 * MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Row(
                      children: [
                        if (userSubList.isNotEmpty) ...[
                          Text(
                            'Ваши подписки',
                            style: TextStyle(
                                fontSize: adaptiveSize(context, 26.0),
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ] else ...[
                          Text(
                            'Доступные подписки',
                            style: TextStyle(
                                fontSize: adaptiveSize(context, 26.0),
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],

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

                for (var containerNumber in userSubList) ...[
                  subscribeContainersDict[containerNumber]!,

                  SizedBox(height: adaptiveSize(context, 20.0)),
                ],

                if (userSubList.length != 3) ...[
                  if (userSubList.isNotEmpty) ...[
                    SizedBox(height: adaptiveSize(context, 30.0)),

                    Container(
                        width: 0.9 * MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Text(
                              'Доступные подписки',
                              style: TextStyle(
                                  fontSize: adaptiveSize(context, 26.0),
                                  fontWeight: FontWeight.w600
                              ),
                            ),

                            Spacer(),
                          ],
                        )
                    ),

                    SizedBox(height: adaptiveSize(context, 20.0)),
                  ],

                  for (int i = 1; i < 4; i++) ...[
                    if (!userSubList.contains(i)) ... [
                      subscribeContainersDict[i]!,
                      SizedBox(height: adaptiveSize(context, 20.0)),
                    ]
                  ],
                ],

                Spacer(),

                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    height: adaptiveSize(context, 50.0),
                    decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Оформить подписку',
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
    );
  }
}
