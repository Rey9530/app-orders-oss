import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/fontfamily.dart';
import '../config/mediaquery/mediaquery.dart';
import '../utils/sizeconfig/sizeconfig.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onchange;
  final bool obscureText;
  final Function()? onTap;

  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.onchange,
    required this.obscureText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: kIsWeb ? SizeConfig.kPadding400 : width / 1.13,
      child: TextFormField(
        style:
            TextStyle(color: AppColors.blackColor, fontFamily: poppinsRegular),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
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
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              size: height / 30,
              color: AppColors.lightBlueColor,
            ),
          ),
        ),
        onChanged: onchange,
      ),
    );
  }
}
