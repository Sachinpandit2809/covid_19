import 'package:flutter/material.dart';

extension numX on num {
  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );
  SizedBox get widthBox => SizedBox(
        width: toDouble(),
      );
}
