
import 'dart:convert';

NationalizeApiResModel nationalizeApiResModelFromJson(String str) => NationalizeApiResModel.fromJson(json.decode(str));

class NationalizeApiResModel {
    num? count;
    String? name;
    List<Country>? country;

    NationalizeApiResModel({
        this.count,
        this.name,
        this.country,
    });

    factory NationalizeApiResModel.fromJson(Map<String, dynamic> json) => NationalizeApiResModel(
        count: json["count"],
        name: json["name"],
        country: json["country"] == null ? [] : List<Country>.from(json["country"]!.map((x) => Country.fromJson(x))),
    );
}

class Country {
    String? countryId;
    num? probability;

    Country({
        this.countryId,
        this.probability,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        probability: json["probability"]?.toDouble(),
    );


}
