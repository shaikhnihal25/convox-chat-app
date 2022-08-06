import 'package:convox/utils/iColors.dart';
import 'package:flutter/material.dart';

openBottomSheet(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  showBottomSheet(
      context: context,
      elevation: 2.2,
      builder: (context) {
        return Container(
          height: height / 3,
          width: width,
          color: IColors.placeholder,
        );
      });
}
