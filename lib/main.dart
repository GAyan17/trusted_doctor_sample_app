import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter/rendering.dart';

import './scoped_model/user_model.dart';
import './pages/home.dart';
import './pages/faq.dart';
import './pages/login_page.dart';
import './pages/search_page.dart';
import './pages/sign_up_page.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: UserModel(),
      child: MaterialApp(
        //debugShowMaterialGrid: true,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          accentColor: Colors.blueAccent,
        ),
        //home: HomePage(),
        routes: {
          '/': (BuildContext context) => HomePage(),
          '/faq': (BuildContext context) => FAQPage(),
          '/login': (BuildContext context) => LoginPage(),
          '/search': (BuildContext context) => SearchPage(),
          '/signup' : (BuildContext context) => SignUpPage()
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) => HomePage());
        },
      ),
    );
  }
}
