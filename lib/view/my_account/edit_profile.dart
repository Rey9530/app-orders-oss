import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons.dart';
import '../../../../components/common_textfield.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../components/dropdown.dart';
import '../../../../components/validation/validation.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../controller/profile_controller/profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ProfileController _profileController = Get.put(ProfileController());

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: CustomAppBar(
          title: EnString.editProfile,
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: Center(
                    child: CommonTextfield(
                      obscuretext: false,
                      hinttext: 'First Name',
                      controller: _profileController.firstname,
                      validator: (value) {
                        return Validation.normalvalidation(
                            value: value, errortext: 'Please Enter First name');
                      },
                      onchange: (value) {
                        String? val = Validation.normalvalidation(
                            value: value, errortext: 'Please Enter First name');
                        if (val == null) {
                          _profileController.setFirstValidation(true);
                        } else {
                          _profileController.setFirstValidation(false);
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: Center(
                    child: CommonTextfield(
                      obscuretext: false,
                      hinttext: 'Last Name',
                      controller: _profileController.lastname,
                      validator: (value) {
                        return Validation.normalvalidation(
                            value: value, errortext: 'Please Enter Last name');
                      },
                      onchange: (value) {
                        String? val = Validation.normalvalidation(
                            value: value, errortext: 'Please Enter Last name');
                        if (val == null) {
                          _profileController.setLastValidation(true);
                        } else {
                          _profileController.setLastValidation(false);
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: Center(
                    child: CommonTextfield(
                      obscuretext: false,
                      hinttext: 'Email',
                      controller: _profileController.email,
                      validator: (value) {
                        return Validation.emailvalidation(
                            value: value,
                            errortext: 'Please Enter Valid email');
                      },
                      onchange: (value) {
                        String? val = Validation.emailvalidation(
                            value: value, errortext: 'Please Enter Last name');
                        if (val == null) {
                          _profileController.setEmailValidation(true);
                        } else {
                          _profileController.setEmailValidation(false);
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: Center(
                    child: CommonTextfield(
                      obscuretext: false,
                      hinttext: 'Phone Number',
                      controller: _profileController.phone,
                      validator: (value) {
                        return Validation.phonenumbervalidation(value);
                      },
                      onchange: (value) {
                        String? val = Validation.phonenumbervalidation(value);
                        if (val == null) {
                          _profileController.setPhoneNumberValidation(true);
                        } else {
                          _profileController.setPhoneNumberValidation(false);
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                DropDownDemo(
                  // ignore: invalid_use_of_protected_member
                  data: _profileController.items.value,
                  hint: EnString.male,
                ),
                SizedBox(
                  height: height / 14,
                ),
                Buttons(
                  btnText: EnString.saveChange,
                  buttonColor:AppColors.lightBlueColor,
                  onTap: () {
                    if (_form.currentState!.validate()) {
                      Get.back();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
