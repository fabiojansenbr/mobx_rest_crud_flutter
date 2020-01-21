import 'package:flutter/material.dart';
import 'package:mobx_api_flutter/src/pages/companies_page.dart';
import 'package:mobx_api_flutter/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('buildei o myApp');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CompaniesPage(),
    );
  }
}
