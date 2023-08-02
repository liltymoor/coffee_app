import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phonePrefixController = TextEditingController(text: '+7');
  final _phoneNumberController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  bool _showVerificationCode = false;

  final _appColor = const Color(0xFFFCF8F3); // Нежный кофейный оттенок
  final _inputFieldColor = const Color(0xFFE8DED3); // Слегка темнее оттенок для поля ввода
  final _titleColor = const Color(0xFF6C4F1F);
  final _textColor = const Color(0xFF000000);
  final _hintColor = const Color(0x54000000);
  final _buttonColor = const Color(0xFF78A0CE);

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid != null && isValid) {
      if (!_showVerificationCode) {
        setState(() {
          _showVerificationCode = true;
        });
      } else {
        if (_verificationCodeController.text.replaceAll(' ', '') == '123456') {
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid verification code!')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColor,
      appBar: AppBar(
        title: const Text('Login'),
        titleTextStyle: TextStyle(
          color: _titleColor,
          fontSize: 26,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: _appColor,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16.0, top: 16.0, right: 4, bottom: 16.0),
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: _inputFieldColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    _phonePrefixController.text,
                                    style: TextStyle(
                                      color: _textColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 4,
                                      top: 16.0,
                                      right: 16.0,
                                      bottom: 16.0
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  decoration: BoxDecoration(
                                    color: _inputFieldColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: TextFormField(
                                    controller: _phoneNumberController,
                                    style: TextStyle(
                                      color: _textColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please enter your phone number';
                                      }
                                      if (value!.replaceAll(' ', '').length != 10) {
                                        return 'Phone number must have 10 digits';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    maxLength: 13,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      PhoneNumberFormatter(),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: '987 654 32 10',
                                      hintStyle: TextStyle(
                                          color: _hintColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                      ),
                                      border: InputBorder.none,
                                      counterText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_showVerificationCode)
                           Container(
                             margin: const EdgeInsets.only(
                                 left: 16.0,
                                 top: 16.0,
                                 right: 16.0,
                                 bottom: 16.0
                             ),
                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
                             decoration: BoxDecoration(
                               color: _inputFieldColor,
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                            child: TextFormField(
                              controller: _verificationCodeController,
                              style: TextStyle(
                                color: _textColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter the verification code';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 7,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ConfirmCodeFormatter(),
                              ],
                              decoration: InputDecoration(
                                hintText: '000 000',
                                hintStyle: TextStyle(
                                  color: _hintColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                fillColor: _inputFieldColor,
                                filled: true,
                                border: InputBorder.none,
                                // Removes the underline
                                counterText: '',  // Removes the counter
                              ),
                            ),
                          )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          backgroundColor: _buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(color: _appColor),
                        ),
                        onPressed: _trySubmit,
                        child: _showVerificationCode ? Text(
                            'Login',
                            style: TextStyle(
                              color: _appColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )
                        ) : Text(
                            'Next',
                            style: TextStyle(
                              color: _appColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int selectionIndex = newValue.selection.end;

    final oldValueTextNoSpaces = oldValue.text.replaceAll(' ', '');
    var newValueTextCopy = newValue.text;

    if (oldValueTextNoSpaces.length == newValueTextCopy.length) {
      newValueTextCopy = newValueTextCopy.substring(0, selectionIndex - 1) +
          newValueTextCopy.substring(selectionIndex);

      newValue = newValue.copyWith(
          selection: TextSelection.collapsed(
              offset: newValue.selection.end - 1
          )
      );
    }

    final StringBuffer newString = StringBuffer();
    final int len = newValueTextCopy.length;
    for (int i = 0; i < len; i++) {
      if (i != 0 && (i == 3 || i == 6 || i == 8)) {
        newString.write(' ');
        if (i < selectionIndex) {
          newValue = newValue.copyWith(
              selection: TextSelection.collapsed(
                  offset: newValue.selection.end + 1
              )
          );
        }
      }
      newString.write(newValueTextCopy[i]);
    }

    return TextEditingValue(
      text: newString.toString(),
      selection: newValue.selection,
    );
  }
}

class ConfirmCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int selectionIndex = newValue.selection.end;

    final oldValueTextNoSpaces = oldValue.text.replaceAll(' ', '');
    var newValueTextCopy = newValue.text;

    if (oldValueTextNoSpaces.length == newValueTextCopy.length) {
      newValueTextCopy = newValueTextCopy.substring(0, selectionIndex - 1) +
          newValueTextCopy.substring(selectionIndex);

      newValue = newValue.copyWith(
          selection: TextSelection.collapsed(
              offset: newValue.selection.end - 1
          )
      );
    }

    final StringBuffer newString = StringBuffer();
    final int len = newValueTextCopy.length;
    for (int i = 0; i < len; i++) {
      if (i != 0 && i == 3) {
        newString.write(' ');
        if (i < selectionIndex) {
          newValue = newValue.copyWith(
              selection: TextSelection.collapsed(
                  offset: newValue.selection.end + 1
              )
          );
        }
      }
      newString.write(newValueTextCopy[i]);
    }

    return TextEditingValue(
      text: newString.toString(),
      selection: newValue.selection,
    );
  }
}