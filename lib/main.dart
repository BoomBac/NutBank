

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'global/transaction_record.dart';
import 'routes.dart';

void main() 
{
  runApp(
    ChangeNotifierProvider(create: (context) => RecordProvider(),
        child: const MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nut Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routers,
    );
  }
}
