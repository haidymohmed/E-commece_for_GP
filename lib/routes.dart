import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/veryfiycodeshignup.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/sginup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce/view/screen/languge.dart';
import 'package:ecommerce/view/screen/ondoarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: Approutes.login, page: () => const Login()),
  GetPage(name: Approutes.signUp, page: () => const SginUp()),
  GetPage(name: Approutes.forgetPassword, page: () => const ForGetPassword()),
  GetPage(name: Approutes.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: Approutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: Approutes.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: Approutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: Approutes.onBorading, page: () => const OnBoarding()),
  GetPage(
      name: Approutes.verfiycodeSignUp, page: () => const VerfiyCodeSignUp()),
];
