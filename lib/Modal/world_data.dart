// To parse this JSON data, do
//
//     final worldModel = worldModelFromJson(jsonString);

import 'dart:convert';

Map<String, double> worldModelFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, double>(k, v?.toDouble()));

String worldModelToJson(Map<String, double> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));

class WorldModel {
  final int updated;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final double casesPerOneMillion;
  final double deathsPerOneMillion;
  final double tests;
  final double testsPerOneMillion;
  final double population;
  final double oneCasePerPeople;
  final double oneDeathPerPeople;
  final double oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;
  final int affectedCountries;

  WorldModel({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });

  factory WorldModel.fromJson(Map<String, dynamic> json) => WorldModel(
        updated: json["updated"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        todayRecovered: json["todayRecovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"].toDouble(),
        deathsPerOneMillion: json["deathsPerOneMillion"].toDouble(),
        tests: json["tests"].toDouble(),
        testsPerOneMillion: json["testsPerOneMillion"].toDouble(),
        population: json["population"].toDouble(),
        oneCasePerPeople: json["oneCasePerPeople"].toDouble(),
        oneDeathPerPeople: json["oneDeathPerPeople"].toDouble(),
        oneTestPerPeople: json["oneTestPerPeople"].toDouble(),
        activePerOneMillion: json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
        affectedCountries: json["affectedCountries"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "tests": tests,
        "testsPerOneMillion": testsPerOneMillion,
        "population": population,
        "oneCasePerPeople": oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion,
        "affectedCountries": affectedCountries,
      };
}
