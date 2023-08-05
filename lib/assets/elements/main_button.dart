
import 'package:flutter/material.dart';

import '../constants/color_scheme.dart';
import '../constants/element_setting.dart';

class MainButtonWidget extends StatelessWidget {
  final VoidCallback _onPressMethod;
  final String _buttonText;

  const MainButtonWidget(this._onPressMethod, this._buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      constraints: MainButton.constraints,
      margin: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50.0),
          backgroundColor: AppColor.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: _onPressMethod,
        child: Text(_buttonText, style: MainButton.textStyle),
      ),
    );
  }

}