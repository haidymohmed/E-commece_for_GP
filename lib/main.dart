import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/features/home/home.dart';
import 'package:ecommerce/routes.dart';
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
import 'core/locallization/changelocal.dart';
import 'core/locallization/transation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initialServices();
  runApp(
      MultiProvider(
        providers: [
          BlocProvider (create: (_) => ChangeLanguageCubit()),
          ChangeNotifierProvider(create: (_) => AsyncCall()),
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
          title: 'Flutter Demo',
          locale: controller.language,
          //theme: controller.appTheme,
          initialBinding: MyBinding(),
          getPages: routes,
          theme: ThemeData(
              brightness: Provider.of<UserDarkTheme>(context).isDark ? Brightness.dark : Brightness.light
          ),
          useInheritedMediaQuery: true,
        );
      }
    );
  }
}
