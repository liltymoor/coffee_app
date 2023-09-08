import 'dart:math';

import 'package:flutter/material.dart';


double adaptiveSize(BuildContext context, double size) {
  // double baseSize = 1800.0;
  double baseSize = 900.0;
  // double baseSize = 450.0;
  double scaleHeight = MediaQuery.of(context).size.height / baseSize;

  return size * scaleHeight;
}
