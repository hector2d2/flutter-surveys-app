import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:encuestas/lab/pages/home.dart';
import 'package:encuestas/pages/home.dart';
import 'package:encuestas/provider/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        //  HomeLabPage(),
      ),
    );
  }
}
