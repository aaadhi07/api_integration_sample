import 'package:api_integration_sample/controler/fact_screen_controler.dart';
import 'package:api_integration_sample/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactScreen extends StatefulWidget {
  const FactScreen({super.key});

  @override
  State<FactScreen> createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  @override
  Widget build(BuildContext context) {
      final FactScreenState = context.watch<FactScreenControler>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FactScreenControler>().getRandomFact();//call provider class
        },
        child: Icon(Icons.refresh,color: Colors.green,),),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.lightGreen,
                radius: 20,
                child: Text(
                  FactScreenState.factModel?.length.toString()?? "0",
                ),
              ),
              SizedBox(height: 20),
              Text(
                FactScreenState.factModel?.fact.toString()?? "0",
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),
              )
            ],
          ),
        ),
      ),
    );
  }
}