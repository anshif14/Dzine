// To parse this JSON data, do
//
//     final placeApiModel = placeApiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlaceApiModel placeApiModelFromJson(String str) => PlaceApiModel.fromJson(json.decode(str));

String placeApiModelToJson(PlaceApiModel data) => json.encode(data.toJson());

class PlaceApiModel {
  final double latitude;
  final String lookupSource;
  final double longitude;
  final String localityLanguageRequested;
  final String continent;
  final String continentCode;
  final String countryName;
  final String countryCode;
  final String principalSubdivision;
  final String principalSubdivisionCode;
  final String city;
  final String locality;
  final String postcode;
  final String plusCode;
  final LocalityInfo localityInfo;

  PlaceApiModel({
    required this.latitude,
    required this.lookupSource,
    required this.longitude,
    required this.localityLanguageRequested,
    required this.continent,
    required this.continentCode,
    required this.countryName,
    required this.countryCode,
    required this.principalSubdivision,
    required this.principalSubdivisionCode,
    required this.city,
    required this.locality,
    required this.postcode,
    required this.plusCode,
    required this.localityInfo,
  });

  PlaceApiModel copyWith({
    double? latitude,
    String? lookupSource,
    double? longitude,
    String? localityLanguageRequested,
    String? continent,
    String? continentCode,
    String? countryName,
    String? countryCode,
    String? principalSubdivision,
    String? principalSubdivisionCode,
    String? city,
    String? locality,
    String? postcode,
    String? plusCode,
    LocalityInfo? localityInfo,
  }) =>
      PlaceApiModel(
        latitude: latitude ?? this.latitude,
        lookupSource: lookupSource ?? this.lookupSource,
        longitude: longitude ?? this.longitude,
        localityLanguageRequested: localityLanguageRequested ?? this.localityLanguageRequested,
        continent: continent ?? this.continent,
        continentCode: continentCode ?? this.continentCode,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        principalSubdivision: principalSubdivision ?? this.principalSubdivision,
        principalSubdivisionCode: principalSubdivisionCode ?? this.principalSubdivisionCode,
        city: city ?? this.city,
        locality: locality ?? this.locality,
        postcode: postcode ?? this.postcode,
        plusCode: plusCode ?? this.plusCode,
        localityInfo: localityInfo ?? this.localityInfo,
      );

  factory PlaceApiModel.fromJson(Map<String, dynamic> json) => PlaceApiModel(
    latitude: json["latitude"]?.toDouble(),
    lookupSource: json["lookupSource"],
    longitude: json["longitude"]?.toDouble(),
    localityLanguageRequested: json["localityLanguageRequested"],
    continent: json["continent"],
    continentCode: json["continentCode"],
    countryName: json["countryName"],
    countryCode: json["countryCode"],
    principalSubdivision: json["principalSubdivision"],
    principalSubdivisionCode: json["principalSubdivisionCode"],
    city: json["city"],
    locality: json["locality"],
    postcode: json["postcode"],
    plusCode: json["plusCode"],
    localityInfo: LocalityInfo.fromJson(json["localityInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "lookupSource": lookupSource,
    "longitude": longitude,
    "localityLanguageRequested": localityLanguageRequested,
    "continent": continent,
    "continentCode": continentCode,
    "countryName": countryName,
    "countryCode": countryCode,
    "principalSubdivision": principalSubdivision,
    "principalSubdivisionCode": principalSubdivisionCode,
    "city": city,
    "locality": locality,
    "postcode": postcode,
    "plusCode": plusCode,
    "localityInfo": localityInfo.toJson(),
  };
}

class LocalityInfo {
  final List<Ative> administrative;
  final List<Ative> informative;

  LocalityInfo({
    required this.administrative,
    required this.informative,
  });

  LocalityInfo copyWith({
    List<Ative>? administrative,
    List<Ative>? informative,
  }) =>
      LocalityInfo(
        administrative: administrative ?? this.administrative,
        informative: informative ?? this.informative,
      );

  factory LocalityInfo.fromJson(Map<String, dynamic> json) => LocalityInfo(
    administrative: List<Ative>.from(json["administrative"].map((x) => Ative.fromJson(x))),
    informative: List<Ative>.from(json["informative"].map((x) => Ative.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "administrative": List<dynamic>.from(administrative.map((x) => x.toJson())),
    "informative": List<dynamic>.from(informative.map((x) => x.toJson())),
  };
}

class Ative {
  final String name;
  final String description;
  final String isoName;
  final int order;
  final int adminLevel;
  final String isoCode;
  final String wikidataId;
  final int geonameId;

  Ative({
    required this.name,
    required this.description,
    required this.isoName,
    required this.order,
    required this.adminLevel,
    required this.isoCode,
    required this.wikidataId,
    required this.geonameId,
  });

  Ative copyWith({
    String? name,
    String? description,
    String? isoName,
    int? order,
    int? adminLevel,
    String? isoCode,
    String? wikidataId,
    int? geonameId,
  }) =>
      Ative(
        name: name ?? this.name,
        description: description ?? this.description,
        isoName: isoName ?? this.isoName,
        order: order ?? this.order,
        adminLevel: adminLevel ?? this.adminLevel,
        isoCode: isoCode ?? this.isoCode,
        wikidataId: wikidataId ?? this.wikidataId,
        geonameId: geonameId ?? this.geonameId,
      );

  factory Ative.fromJson(Map<String, dynamic> json) => Ative(
    name: json["name"],
    description: json["description"],
    isoName: json["isoName"],
    order: json["order"],
    adminLevel: json["adminLevel"],
    isoCode: json["isoCode"],
    wikidataId: json["wikidataId"],
    geonameId: json["geonameId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "isoName": isoName,
    "order": order,
    "adminLevel": adminLevel,
    "isoCode": isoCode,
    "wikidataId": wikidataId,
    "geonameId": geonameId,
  };
}
