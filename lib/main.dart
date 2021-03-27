import 'package:flutter/material.dart';

import 'package:jc_app_news/src/pages/TabsPage.dart';
import 'package:jc_app_news/src/services/NewsServices.dart';
import 'package:jc_app_news/src/theme/TemaAppNews.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: temaAppNews,
          home: TabsPage()),
    );
  }
}
