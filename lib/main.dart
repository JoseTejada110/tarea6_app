import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea6_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarStateManagement()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarea 6',
        home: HomePage(),
      ),
    );
  }
}