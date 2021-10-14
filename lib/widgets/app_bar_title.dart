import 'package:flutter/material.dart';
import 'package:webproject/res/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 8),
        // Text(
        //   'FlutterFire Assignment',
        //   style: TextStyle(
        //     color: CustomColors.firebaseYellow,
        //     fontSize: 18,
        //   ),
        // ),
      ],
    );
  }
}
