import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/fitted_image.dart';
import 'package:my_app/widgets/password_input.dart';
import 'package:my_app/widgets/username_input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _firstImage = Image.network(
      'https://www.mmda.mb.ca/wp-content/uploads/2019/04/DP-Logo-2-1024x379.png');
  final _secondImage = Image.network(
      'https://applotusunstablebackend.azurewebsites.net/img/cada.feabdd54.png');
  final _scrollContoroller = ScrollController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollContoroller,
        reverse: true,
        child: Container(
          height: _screenSize.height ,
          color: Colors.lightBlue,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              height: _screenSize.height * 0.8,
              width: _screenSize.width * 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Image.network(
                      'https://applotusunstablebackend.azurewebsites.net/img/logo.bfad0c66.png',
                      scale: 2.4,
                    ),
                  ),
                  SizedBox(
                    height: _screenSize.height * 0.15,
                  ),
                  Container(
                    height: _screenSize.height * 0.09,
                    width: _screenSize.width * 0.8,
                    padding: const EdgeInsets.all(10),
                    child: UsernameInput(
                        emailFocusNode: _emailFocusNode,
                        passwordFocusNode: _passwordFocusNode),
                  ),
                  Container(
                    height: _screenSize.height * 0.09,
                    width: _screenSize.width * 0.8,
                    padding: const EdgeInsets.all(10),
                    child: PasswordInput(
                      passwordFocusNode: _passwordFocusNode,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                      bottom: 5,
                    ),
                    width: _screenSize.width * 0.8,
                    height: _screenSize.height * 0.09,
                    child: ElevatedButton(
                      onPressed: () {
                        var currentLocale = context.locale;
                        if (currentLocale == const Locale('en', 'US')) {
              
                        setState(() {
                          context.setLocale(const Locale('de', 'DE'));
                        });}  
                         if (currentLocale == const Locale('de', 'DE')) {
              
                        setState(() {
                          context.setLocale(const Locale('uk', 'UA'));
                        });} if( currentLocale == const Locale('uk','UA'))  {
                           setState(() {
                          context.setLocale(const Locale('en', 'US'));
                        });
                        }
                      },
                      child: Center(
                        child: Text('login'.tr()),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'reset_password'.tr(),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          height: _screenSize.height * 0.1,
                          width: _screenSize.width * 0.35,
                          padding: const EdgeInsets.all(10.0),
                          child: FittedImage(image: _firstImage),
                        ),
                        const Spacer(),
                        Container(
                          height: _screenSize.height * 0.1,
                          width: _screenSize.width * 0.35,
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                              fit: BoxFit.fill, child: _secondImage),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
