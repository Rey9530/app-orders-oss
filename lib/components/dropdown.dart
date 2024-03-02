import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/colors/colors.dart';
import '../config/fontfamily.dart';
import '../config/images/images.dart';
import '../config/mediaquery/mediaquery.dart';
import '../models/dropdown.mode.dart';

// ignore: must_be_immutable
class DropDownDemo extends StatefulWidget {
  final String hint;
  final Function(dynamic)? onchange;
  final List<DropdowmItem> data;
  String? chosenValue;
  DropDownDemo({
    super.key,
    required this.data,
    required this.hint,
    this.onchange,
    this.chosenValue,
  });

  @override
  State<DropDownDemo> createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
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
                  value: widget.chosenValue,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: height / 50,
                        color: AppColors.indicatorGreyColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: poppinsRegular,
                      ),
                  iconSize: 25,
                  underline: const SizedBox(),
                  items: widget.data.map<DropdownMenuItem<String>>(
                    (DropdowmItem value) {
                      return DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: Text(value.title),
                      );
                    },
                  ).toList(),
                  hint: Text(
                    widget.hint,
                  ),
                  isExpanded: true,
                  onChanged: (String? value) {
                    setState(() {
                      widget.chosenValue = value;
                    });
                    if (widget.onchange != null) {
                      widget.onchange!(value);
                    }
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
