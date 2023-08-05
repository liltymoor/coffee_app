import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:coffee_app/assets/elements/main_button.dart';
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
  final _verificationCode_Controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  bool _showVerificationCode = false;

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid != null && isValid) {
      if (!_showVerificationCode) {
        setState(() {
          _showVerificationCode = true;
        });
      } else {
        String code = "";
        _verificationCode_Controllers.forEach((element) {
          code += element.text;
        });
        if (code.replaceAll(' ', '') == '1234') {
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
      backgroundColor: AppColor.appColor,
      body: Center(child: LayoutBuilder(
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
                                margin: const EdgeInsets.only(
                                    left: 16.0,
                                    top: 16.0,
                                    right: 4,
                                    bottom: 16.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: AppColor.inputFieldColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    _phonePrefixController.text,
                                    style: const TextStyle(
                                      color: AppColor.textColor,
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
                                      bottom: 16.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  decoration: BoxDecoration(
                                    color: AppColor.inputFieldColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: TextFormField(
                                    controller: _phoneNumberController,
                                    style: const TextStyle(
                                      color: AppColor.textColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please enter your phone number';
                                      }
                                      if (value!.replaceAll(' ', '').length !=
                                          10) {
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
                                    decoration: const InputDecoration(
                                      hintText: '987 654 32 10',
                                      hintStyle: TextStyle(
                                        color: AppColor.hintColor,
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
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InputCodePartWidget(
                                        _verificationCode_Controllers[0],
                                        submitFunc: _trySubmit),
                                    InputCodePartWidget(
                                        _verificationCode_Controllers[1],
                                        submitFunc: _trySubmit),
                                    InputCodePartWidget(
                                        _verificationCode_Controllers[2],
                                        submitFunc: _trySubmit),
                                    InputCodePartWidget(
                                        _verificationCode_Controllers[3],
                                        submitFunc: _trySubmit, last: true)
                                  ]
                              )
                          )
                      ],
                    ),
                    MainButtonWidget(_trySubmit, "Далее"),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}

// ==========================================================================
// ==========================================================================
// ========================InputCodePartWidget===============================
// ==========================================================================
// ==========================================================================

class InputCodePartWidget extends StatelessWidget {
  final TextEditingController _verificationCodeController;
  final bool last;
  final VoidCallback submitFunc;


  const InputCodePartWidget(this._verificationCodeController,
      {super.key, this.last = false, required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,

      height: 75,
      width: 60,

      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColor.inputFieldColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(

        onChanged: (String s) {
          if (s != "")
            FocusScope.of(context).nextFocus();
          if (last)
            submitFunc();
        },

        textAlign: TextAlign.center,
        controller: _verificationCodeController,


        style: const TextStyle(
          color: AppColor.textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CodeFormatter(),
        ],
        decoration: const InputDecoration(
          hintText: '-',
          hintStyle: TextStyle(
            color: AppColor.hintColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          fillColor: AppColor.inputFieldColor,
          filled: true,
          border: InputBorder.none,
          // Removes the underline
          counterText: '', // Removes the counter
        ),
      ),
    );
  }
}

// ==========================================================================
// ==========================================================================
// ============================FORMATTERS====================================
// ==========================================================================
// ==========================================================================

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final int selectionIndex = newValue.selection.end;

    final oldValueTextNoSpaces = oldValue.text.replaceAll(' ', '');
    var newValueTextCopy = newValue.text;

    if (oldValueTextNoSpaces.length == newValueTextCopy.length) {
      newValueTextCopy = newValueTextCopy.substring(0, selectionIndex - 1) +
          newValueTextCopy.substring(selectionIndex);

      newValue = newValue.copyWith(
          selection:
          TextSelection.collapsed(offset: newValue.selection.end - 1));
    }

    final StringBuffer newString = StringBuffer();
    final int len = newValueTextCopy.length;
    for (int i = 0; i < len; i++) {
      if (i != 0 && (i == 3 || i == 6 || i == 8)) {
        newString.write(' ');
        if (i < selectionIndex) {
          newValue = newValue.copyWith(
              selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1));
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

class CodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final int selectionIndex = newValue.selection.end;

    final oldValueTextNoSpaces = oldValue.text.replaceAll(' ', '');
    var newValueTextCopy = newValue.text;

    if (oldValueTextNoSpaces.length == newValueTextCopy.length) {
      newValueTextCopy = newValueTextCopy.substring(0, selectionIndex - 1) +
          newValueTextCopy.substring(selectionIndex);

      newValue = newValue.copyWith(
          selection:
          TextSelection.collapsed(offset: newValue.selection.end - 1));
    }

    final StringBuffer newString = StringBuffer();
    final int len = newValueTextCopy.length;
    for (int i = 0; i < len; i++) {
      if (i != 0 && i == 3) {
        newString.write(' ');
        if (i < selectionIndex) {
          newValue = newValue.copyWith(
              selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1));
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
