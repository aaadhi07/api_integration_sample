
import 'dart:convert';

FactModel factModelFromJson(String str) => FactModel.fromJson(json.decode(str));

class FactModel {
    String? fact;
    num? length;

    FactModel({
        this.fact,
        this.length,
    });

    factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
        fact: json["fact"],
        length: json["length"],
    );

}
