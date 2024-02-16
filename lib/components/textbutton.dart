import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/fontfamily.dart';
import '../config/mediaquery/mediaquery.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;

  const CustomTextButton({Key? key, this.onPressed, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed!() ?? () {};
      },
      child: Text(
        buttonText ?? '',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: height / 55,
            fontFamily: poppinsMedium,
            color: AppColors.lightBlueColor),
      ),
    );
  }
}
