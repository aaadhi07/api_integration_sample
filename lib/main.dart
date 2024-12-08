import 'package:api_integration_sample/controler/fact_screen_controler.dart';
import 'package:api_integration_sample/controler/nationalize_api_screen_controler.dart';
import 'package:api_integration_sample/view/fact_screen/fact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FactScreenControler(),),
        ChangeNotifierProvider(create: (context) => NationalizeApiScreenControler(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FactScreen(),
      ),
    );
  }
}