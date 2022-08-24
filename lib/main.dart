import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Language/codegen_loader.g.dart';
import 'binding.dart';
import 'controller/AsyncCall.dart';
import 'controller/ChangeLanguage/language_cubit.dart';
import 'controller/DarkTheme.dart';
import 'controller/card.dart';
import 'controller/favorite.dart';
import 'controller/order.dart';
import 'core/locallization/changelocal.dart';
import 'core/locallization/transation.dart';
import 'features/card/domain/card_display/card_cubit.dart';
import 'features/category screen/domain/category_products_cubit.dart';
import 'features/category screen/domain/category_products_cubit.dart';
import 'features/home/domin/categories/category_cubit.dart';
import 'features/products/domain/products_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await initialServices();
  runApp(
      MultiProvider(
        providers: [
          BlocProvider (create: (_) => ChangeLanguageCubit()),
          BlocProvider (create: (_) => GetCategoriesCubit()),//CategoryScreenUseCase
          BlocProvider (create: (_) => CategoryScreenUseCase()..filterProductWithHighPrice( id: "laptop")),//DisplayProductsCubit
          BlocProvider (create: (_) => DisplayProductsCubit()),//CardCubit//DisplayProductsCubit
          BlocProvider (create: (_) => CardCubit()),//CardCubit
          ChangeNotifierProvider(create: (_) => AsyncCall()),
          ChangeNotifierProvider(create: (_) => FavoriteTest()),//CardTest
          ChangeNotifierProvider(create: (_) => CardTest()),//OrderTest
          ChangeNotifierProvider(create: (_) => OrderTest()),//OrderTest
          ChangeNotifierProvider(create: (_) => UserDarkTheme()),
        ],
        child: EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            saveLocale: true,
            path: 'asset/Language', // <-- change the path of the translation files
            fallbackLocale: const Locale('en'),
            assetLoader: const CodegenLoader(),
            child: const MyApp()
        ),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          locale: controller.language,
          //theme: controller.appTheme,
          initialBinding: MyBinding(),
          getPages: routes,
          theme: ThemeData(
              fontFamily: "PlayfairDisplay",
              textTheme: TextTheme(
                  headline1: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.sp, color: AppColor.black),
                  headline2: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 26.sp, color: AppColor.black),
                  bodyText1: TextStyle(
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                  bodyText2: TextStyle(color: AppColor.grey, fontSize: 14.sp)
              ),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: AppColor.background,
              brightness: Provider.of<UserDarkTheme>(context).isDark ? Brightness.dark : Brightness.light
          ),
          useInheritedMediaQuery: true,
        );
      }
    );
  }
}
