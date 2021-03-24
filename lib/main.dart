import 'package:flutter/material.dart';
import 'package:jc_app_news/src/pages/TabsPage.dart';
import 'package:jc_app_news/src/theme/TemaAppNews.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: temaAppNews,
      home: TabsPage()
    );
  }
}