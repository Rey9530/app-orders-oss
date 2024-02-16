import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/fontfamily.dart';
import '../../../../config/images/images.dart';
import '../../../../config/mediaquery/mediaquery.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Center(
              child: Image.asset(
                AppImage.emptyorder,
                height: height / 3.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 5),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      EnString.doNotOrder,
                      style: TextStyle(
                        color: AppColors.lightBlueColor,
                        fontSize: height / 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      EnString.ordersTime,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: poppinsMedium,
                        fontSize: height / 60,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
