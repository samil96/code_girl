import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Values/ResponsiveApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ResponsiveApp responsiveApp;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Code Girl",
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        responsiveApp = ResponsiveApp(context);
        return Theme(
            data: ThemeData(
              backgroundColor: Colors.black,
              primaryColor: Color(0xff75CCE8),
              accentColor: Color(0xffCD60DA),
              iconTheme: IconThemeData(color: Color(0xffCD60DA)),
              cardColor: Color(0xffA5DEE5),
              primaryTextTheme: getTextTheme(),
              textTheme: getTextTheme(),
              indicatorColor: Color(0xffCD60DA),
              unselectedWidgetColor: Colors.blueGrey[300],
              tabBarTheme: TabBarTheme(
                labelColor: Color(0xffF7DB70),
                unselectedLabelColor: Colors.blueGrey[300],
              ),
              accentTextTheme: TextTheme(
                  headline6: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: responsiveApp.headline6),
                  bodyText1: TextStyle(
                      color: Color(0xff75CCE8),
                      fontSize: responsiveApp.bodyText1),
                  bodyText2: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: responsiveApp.bodyText1)),
            ),
            child: HomePage());
      },
    );
  }

  getTextTheme() {
    return TextTheme(
      headline3:
          TextStyle(color: Colors.black, fontSize: responsiveApp.headline3),
      headline6:
          TextStyle(color: Colors.indigo, fontSize: responsiveApp.headline6),
      bodyText1:
          TextStyle(color: Colors.black, fontSize: responsiveApp.bodyText1),
      bodyText2:
          TextStyle(color: Colors.green, fontSize: responsiveApp.bodyText1),
      headline2:
          TextStyle(color: Colors.red, fontSize: responsiveApp.headline2),
    );
  }
}
