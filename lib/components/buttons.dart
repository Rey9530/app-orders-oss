import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/mediaquery/mediaquery.dart';
import '../utils/sizeconfig/sizeconfig.dart';

class Buttons extends StatelessWidget {
  final String btnText;
  final Color? buttonColor;
  final Color? textColor;
  final double? minWidth;
  final double? minHeight;
  final FontWeight? fontWeight;
  final Function() onTap;
  final double? textSize;
  final double? fieldRadius;
  final Color? borderColor;
  final IconData? icon;

  const Buttons(
      {Key? key,
      required this.btnText,
      this.buttonColor,
      this.textColor,
      this.minWidth,
      required this.onTap,
      this.textSize,
      this.fontWeight,
      this.fieldRadius,
      this.borderColor,
      this.minHeight,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? SizeConfig.kPadding400 : width / 1.13,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor ?? AppColors.lightBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fieldRadius ?? 10),
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: kIsWeb ? height / 45 : height / 50),
            child: Text(
              btnText,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: height / 50,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
