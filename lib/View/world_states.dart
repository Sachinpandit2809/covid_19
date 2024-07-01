// import 'dart:async';

import 'package:covid_19/Modal/world_data.dart';
import 'package:covid_19/Modal/world_states_model.dart';
import 'package:covid_19/Services/states_services.dart';
import 'package:covid_19/View/country_list_screen.dart';
import 'package:covid_19/extensions/context_extension.dart';
import 'package:covid_19/widgets/information_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    super.initState();
  }

  final colorList = <Color>[
    const Color(0xFF4385F4),
    const Color(0Xff1AA260),
    const Color(0xFFDE5246)
  ];
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          // appBar: AppBar(),

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: FutureBuilder(
                  future: statesServices.fetchWorldStatesRecord(),
                  builder: (context, AsyncSnapshot<WorldModel> snapshot) {
                    if (!snapshot.hasData) {
                      return SpinKitFadingCircle(
                        color: Colors.amber,
                        size: 50,
                        controller: _animationController,
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "total": double.parse(
                                  snapshot.data!.cases!.toString()),
                              "recovered": double.parse(
                                  snapshot.data!.recovered!.toString()),
                              "death": double.parse(
                                  snapshot.data!.deaths!.toString())
                            },
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            animationDuration:
                                const Duration(microseconds: 1200),
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          SizedBox(
                            height: context.height * 0.55,
                            child: ListView(
                              children: [
                                ReUsableRow(
                                    title: "updated",
                                    data: snapshot.data!.updated.toString()),
                                ReUsableRow(
                                    title: "cases",
                                    data: snapshot.data!.cases.toString()),
                                ReUsableRow(
                                    title: "todayCases",
                                    data: snapshot.data!.todayCases.toString()),
                                ReUsableRow(
                                    title: "deaths",
                                    data: snapshot.data!.deaths.toString()),
                                ReUsableRow(
                                    title: "todayDeaths",
                                    data:
                                        snapshot.data!.todayDeaths.toString()),
                                ReUsableRow(
                                    title: "recovered",
                                    data: snapshot.data!.recovered.toString()),
                                ReUsableRow(
                                    title: "todayRecovered",
                                    data: snapshot.data!.todayRecovered
                                        .toString()),
                                ReUsableRow(
                                    title: "critical",
                                    data: snapshot.data!.critical.toString()),
                                ReUsableRow(
                                    title: "casesPerOneMillion",
                                    data: snapshot.data!.casesPerOneMillion
                                        .toString()),
                                ReUsableRow(
                                    title: "deathsPerOneMillion",
                                    data: snapshot.data!.deathsPerOneMillion
                                        .toString()),
                                ReUsableRow(
                                    title: "tests",
                                    data: snapshot.data!.tests.toString()),
                                ReUsableRow(
                                    title: "testsPerOneMillion",
                                    data: snapshot.data!.testsPerOneMillion
                                        .toString()),
                                ReUsableRow(
                                    title: "population",
                                    data: snapshot.data!.population.toString()),
                                ReUsableRow(
                                    title: "oneCasePerPeople",
                                    data: snapshot.data!.oneCasePerPeople
                                        .toString()),
                                ReUsableRow(
                                    title: "oneDeathPerPeople",
                                    data: snapshot.data!.oneDeathPerPeople
                                        .toString()),
                                ReUsableRow(
                                    title: "oneTestPerPeople",
                                    data: snapshot.data!.oneTestPerPeople
                                        .toString()),
                                ReUsableRow(
                                    title: "activePerOneMillion",
                                    data: snapshot.data!.activePerOneMillion
                                        .toString()),
                                ReUsableRow(
                                    title: "recoveredPerOneMillion",
                                    data: snapshot.data!.recoveredPerOneMillion
                                        .toString()),
                                ReUsableRow(
                                    title: "criticalPerOneMillion",
                                    data: snapshot.data!.criticalPerOneMillion
                                        .toString()),
                                ReUsableRow(
                                    title: "affectedCountries",
                                    data: snapshot.data!.affectedCountries
                                        .toString()),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CountryListScreen(),
                                  ));
                            },
                            child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: const Text(
                                  "Track Country",
                                  style: TextStyle(color: Colors.white),
                                ))),
                          ),
                        ],
                      );
                    }
                  }),
            ),
          ),
        ));
  }
}
