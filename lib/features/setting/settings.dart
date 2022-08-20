import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Language/locale_keys.g.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/color.dart';
import '../../core/dialogs/showLanguage.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
import '../../view/wedget/setting_option.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: UserResponsive.get(
                    context: context,
                    mobile: 30.sp,
                    tablet: 30.sp
                ),
                backgroundImage: AssetImage(AppImageAsset.localeTestImage.toString()),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Haidy Mohmed",
            textAlign: TextAlign.center,
            style: UserTheme.get(
                context : context,
                fontSize: UserResponsive.get(
                    context: context,
                    mobile: 15.sp,
                    tablet: 9.sp
                ),
                fontWight: FontWeight.w900,
                colorDark: AppColor.white,
                colorBright: AppColor.black
            ),
          ),
        ),
        Text(
          "haidy@mail.com",
          textAlign: TextAlign.center,
          style : UserTheme.get(
              context : context,
              fontSize: UserResponsive.get(
                  context: context,
                  mobile: 13.sp,
                  tablet: 8.sp
              ),
              fontWight: FontWeight.w500,
              colorDark: AppColor.white,
              colorBright: AppColor.black
          ),
        ),
        SizedBox(height: 5.sp,),
        getSettingOption(
            title: LocaleKeys.language2.tr()  ,
            icon : Icons.arrow_forward_ios_outlined ,
            islast: false ,
            context: context,
            onTap: (){
              showDialog(
                  builder: (_) => ChangeLanguage(), context: context
              );
            }
        ),
        getSettingOption(
          title: LocaleKeys.darkMode.tr()  ,
          icon :  Switch(onChanged: (bool value) {
            Provider.of<UserDarkTheme>(context , listen: false).changeTheme();
          }, value: Provider.of<UserDarkTheme>(context).isDark) ,
          islast:  false,
          context: context,
        ),
        getSettingOption(
          title: LocaleKeys.logOut.tr()  ,
          icon :  null ,
          islast:  true,
          context: context,
        ),
      ],
    );
  }
}
