import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE'),Locale('uk','UA'),],
      path: 'lib/assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child:const HomeScreen() ,
));
}




