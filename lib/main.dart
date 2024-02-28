import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'localizations/app_translation.dart';
import 'controller/storage_controller/storage_controller.dart';
import 'view/home_categories/fashion_category.dart';
import 'view/home_categories/man_jeans.dart';
import 'view/home_categories/rating_reviews.dart';
import 'view/my_address/new_address.dart';
import 'view/my_address/delivery_address.dart';
import 'view/my_cart_screen/applycoupon.dart';
import 'view/my_cart_screen/checkout.dart';
import 'view/my_cart_screen/empty_cart.dart';
import 'view/my_cart_screen/order_confirm.dart';
import 'view/payment_method/enter_pin.dart';
import 'view/login_screen/login.dart';
import 'view/my_account/change_password.dart';
import 'view/my_account/edit_profile.dart';
import 'view/my_account/my_account.dart';

import 'view/account_settings/contact_us.dart';
import 'view/account_settings/help.dart';
import 'view/account_settings/language.dart';
import 'view/account_settings/privacy_policy.dart';
import 'view/account_settings/settings.dart';
import 'view/account_settings/terms_and_conditions.dart';

import 'view/myorder/empty_order.dart';
import 'view/myorder/my_orders.dart';
import 'view/myorder/trackorder.dart';
import 'view/mywishlist/add_towishlist.dart';
import 'view/mywishlist/my_wishlist.dart';
import 'view/onboarding_screen/onboarding_screen.dart';

import 'view/payment_method/add_card.dart';
import 'view/payment_method/payment_method.dart';
import 'view/profile/profile.dart';
import 'view/forgot_password/forgot_password.dart';
import 'view/notification/notification.dart';
import 'view/notification/notification_not_found.dart';
import 'view/product_detail/product_details.dart';

import 'package:sizer/sizer.dart';

import 'config/approutes/approutes.dart';

import 'view/otp_screen/otp_screen.dart';
import 'view/bottom_bar/bottom_bar.dart';

import 'view/home_screen/home_screen.dart';

import 'view/signup_screen/create_account.dart';
import 'view/splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? languageCode = await StorageController.instance.getLanguage();
  String? countryCode = await StorageController.instance.getCountryCode();
  await GetStorage.init();
  runApp(
    MyApp(
      languageCode: languageCode,
      countryCode: countryCode,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.languageCode,
    this.countryCode,
  }) : super(key: key);
  final String? languageCode;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          translationsKeys: AppTranslation.translationsKeys,
          title: "Shop",
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          locale: Locale(languageCode ?? "en", countryCode ?? "US"),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          getPages: [
            GetPage(name: AppRoute.loginscreen, page: () => LoginScreen()),
            GetPage(name: AppRoute.createaccount, page: () => CreateAccount()),
            GetPage(name: AppRoute.otpscreen, page: () => const OtpScreen()),
            GetPage(
                name: AppRoute.forgotpassword, page: () => ForgotPassword()),
            GetPage(name: AppRoute.onbondingscreen, page: () => OnBonding()),
            GetPage(name: AppRoute.homescreen, page: () => HomeScreen()),
            GetPage(name: AppRoute.bottomBar, page: () => BottomBar()),
            GetPage(name: AppRoute.checkout, page: () => Checkout()),
            GetPage(name: AppRoute.applycoupon, page: () => ApplyCoupon()),
            GetPage(
                name: AppRoute.fashioncategory, page: () => FashionCategory()),
            GetPage(name: AppRoute.mansjeans, page: () => MensJeans()),
            GetPage(name: AppRoute.emptycart, page: () => const EmptyCart()),
            GetPage(
                name: AppRoute.orderconfirm, page: () => const OrderConfirm()),
            GetPage(name: AppRoute.profile, page: () => const Profile()),
            GetPage(name: AppRoute.myaccount, page: () => const MyAccount()),
            GetPage(
                name: AppRoute.changepassword, page: () => ChangePassword()),
            GetPage(
                name: AppRoute.productdetails, page: () => ProductDetails()),
            GetPage(name: AppRoute.ratingreviews, page: () => RatingReviews()),
            GetPage(
                name: AppRoute.editprofile, page: () => const EditProfile()),
            GetPage(
                name: AppRoute.notificationnotfound,
                page: () => const NotificationNotFound()),
            GetPage(
                name: AppRoute.notificationscreen,
                page: () => ShowNotificationScreen()),
            GetPage(name: AppRoute.myorders, page: () => const MyOrders()),
            GetPage(name: AppRoute.emptyorder, page: () => const EmptyOrder()),
            GetPage(name: AppRoute.trackorder, page: () => TrackOrder()),
            GetPage(
                name: AppRoute.addtowishlist,
                page: () => const AddToWishList()),
            GetPage(name: AppRoute.mywishlist, page: () => const MyWishList()),
            GetPage(name: AppRoute.settings, page: () => Settings()),
            GetPage(
                name: AppRoute.deliveryaddress, page: () => DeliveryAddress()),
            GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
            GetPage(name: AppRoute.help, page: () => const Help()),
            GetPage(
                name: AppRoute.termsandconditions,
                page: () => const TermAndConditions()),
            GetPage(
                name: AppRoute.privacypolicy,
                page: () => const PrivacyPolicy()),
            GetPage(name: AppRoute.language, page: () => Language()),
            GetPage(name: AppRoute.paymentmethod, page: () => PaymentMethod()),
            GetPage(name: AppRoute.enterpin, page: () => const EnterPin()),
            GetPage(name: AppRoute.addcard, page: () => AddCard()),
            GetPage(name: AppRoute.addnewaddress, page: () => AddNewAddress()),
          ],
        );
      },
    );
  }
}
