import 'package:flutter/material.dart';
import 'package:for_job/src/controller/categories_provider.dart';
import 'package:for_job/src/view/screens/categoris_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CategoriesProvider()),
      ],
      child: MaterialApp(
        title: "task for jop",
        home: CategoriesScreen(),
      ),
    );
  }
}
