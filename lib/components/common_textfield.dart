import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/fontfamily.dart';
import '../config/mediaquery/mediaquery.dart';
import '../utils/sizeconfig/sizeconfig.dart';

class CommonTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onchange;
  final bool obscuretext;
  final TextInputType? keyboardType;

  const CommonTextfield({
    Key? key,
    required this.hinttext,
    required this.controller,
    required this.validator,
    required this.onchange,
    required this.obscuretext,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: kIsWeb ? SizeConfig.kPadding400 : width / 1.13,
      child: TextFormField(
        obscureText: obscuretext,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        style:
            TextStyle(color: AppColors.blackColor, fontFamily: poppinsRegular),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          counterText: '',
          hintText: hinttext,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          filled: true,
          isDense: true,
          fillColor: AppColors.lightGreyFilledColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
                color: AppColors.indicatorGreyColor.withOpacity(0.7), width: 1),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.lightBlueColor, width: 1),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        ),
        onChanged: onchange,
      ),
    );
  }
}
