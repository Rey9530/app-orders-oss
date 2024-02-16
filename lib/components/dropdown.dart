import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/fontfamily.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';

class DropDownDemo extends StatefulWidget {
  final String hint;
  final List<String> data;

  const DropDownDemo({super.key, required this.data, required this.hint});

  @override
  // ignore: library_private_types_in_public_api
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 17),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: AppColors.indicatorGreyColor),
                ),
                child: DropdownButton<String>(
                  value: _chosenValue,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: height / 50,
                      color: AppColors.indicatorGreyColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: poppinsRegular),
                  iconSize: 25,
                  underline: const SizedBox(),
                  items:
                      widget.data.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text(
                    widget.hint,
                  ),
                  isExpanded: true,
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                  icon: Image.asset(
                    IconImage.arrowdown,
                    height: height / 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
