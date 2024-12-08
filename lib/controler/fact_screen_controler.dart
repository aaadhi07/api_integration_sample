import 'dart:developer';
import 'package:api_integration_sample/model/fact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class FactScreenControler with ChangeNotifier{

FactModel? factModel;
  getRandomFact() async {
    final url= Uri.parse("https://catfact.ninja/fact");
    try {
      final response =  await http.get(url);
      if (response.statusCode >= 200 && response.statusCode <300){
     //convert to model class
    // var convertedJson=jsonDecode(response.body);   //decode json data to dart
     factModel = factModelFromJson(response.body);
      }else{
        log("API failled with statuscode : ${response.statusCode}");
      }

    }catch(e){
      print(e.toString());
    }
    notifyListeners();
  }
}