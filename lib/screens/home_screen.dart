import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    'https://www.mmda.mb.ca/wp-content/uploads/2019/04/DP-Logo-2-1024x379.png',
  );
  final _secondImage = Image.network(
      'https://applotusunstablebackend.azurewebsites.net/img/cada.feabdd54.png');
  final _scrollContoroller = ScrollController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  void _animateToLoginButton() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _scrollContoroller.animateTo(
      100,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _changeLang() {
    var currentLocale = context.locale;
    if (currentLocale == const Locale('en', 'US')) {
      setState(() {
        context.setLocale(const Locale('de', 'DE'));
      });
    }
    if (currentLocale == const Locale('de', 'DE')) {
      setState(() {
        context.setLocale(const Locale('uk', 'UA'));
      });
    }
    if (currentLocale == const Locale('uk', 'UA')) {
      setState(() {
        context.setLocale(const Locale('en', 'US'));
      });
    }
  }

  @override
  void initState() {
    _emailFocusNode.addListener(() async {
      if (_emailFocusNode.hasFocus) {
        _animateToLoginButton();
      }
    });
    _passwordFocusNode.addListener(() async {
      if (_passwordFocusNode.hasFocus) {
        _animateToLoginButton();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _mainContainerWidth = _screenSize.width * 0.8;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollContoroller,
        child: Container(
          height: _screenSize.height,
          color: Colors.lightBlue,
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  height: 500,
                  width: _mainContainerWidth,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.network(
                          'https://applotusunstablebackend.azurewebsites.net/img/logo.bfad0c66.png',
                          scale: 2.4,
                        ),
                      ),
                      Column(
                        children: [
                          UsernameInput(
                              emailFocusNode: _emailFocusNode,
                              text: 'username',
                              passwordFocusNode: _passwordFocusNode),
                          PasswordInput(
                            passwordFocusNode: _passwordFocusNode,
                            text: 'password',
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              bottom: 10,
                            ),
                            height: 40,
                            child: ElevatedButton(
                              onPressed: _changeLang,
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: _firstImage,
                              ),
                              flex: 1),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: _secondImage),
                              flex: 1),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: _mainContainerWidth,height: 20,
                  child: Row(
                    children: const [
                      Expanded(flex:1,child: Text('Privacy Policy')),VerticalDivider(thickness: 1.0,color: Colors.white,),
                      Expanded(flex: 1,child: Text('Accessibility Policy')),VerticalDivider(thickness: 1.0,color: Colors.white,),
                       Expanded(flex: 1,child: Text('Signed Doc Terms Of Use')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
