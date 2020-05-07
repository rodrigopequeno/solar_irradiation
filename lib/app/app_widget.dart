import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// MaterialApp configuration
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xff1698CD);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Irradiação Solar',
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
        primaryColor: colorPrimary,
        cursorColor: Colors.blueAccent,
        hintColor: Colors.black,
        textSelectionColor: Colors.white,
        textSelectionHandleColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: colorPrimary,
        ),
        scaffoldBackgroundColor: colorPrimary,
        bottomAppBarColor: colorPrimary,
        bottomAppBarTheme: BottomAppBarTheme(color: colorPrimary),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        primaryIconTheme: IconThemeData(),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.white, fontSize: 20),
          headline1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          headline2: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: Colors.black),
          button: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.white, fontSize: 13),
          caption: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
