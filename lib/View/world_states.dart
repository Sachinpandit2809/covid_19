// import 'dart:async';

import 'package:covid_19/Modal/world_states_model.dart';
import 'package:covid_19/Services/states_services.dart';
import 'package:covid_19/View/country_list_screen.dart';
import 'package:flutter/material.dart';
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
    // Timer(
    //     Duration(seconds: 5),
    //     () => Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => WorldStatesScreen())));
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
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FutureBuilder(
              future: statesServices.fetchWorldStatesRecord(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      child: SpinKitFadingCircle(
                    color: Colors.amber,
                    size: 50,
                    controller: _animationController,
                  ));
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          "total":
                              double.parse(snapshot.data!.cases!.toString()),
                          "recovered": double.parse(
                              snapshot.data!.recovered!.toString()),
                          "death":
                              double.parse(snapshot.data!.deaths!.toString())
                        },
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        animationDuration: const Duration(microseconds: 1200),
                        legendOptions:
                            const LegendOptions(legendPosition: LegendPosition.left),
                        chartType: ChartType.ring,
                        colorList: colorList,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ReUsableRow(
                                  title: "updated",
                                  data: snapshot.data!.updated.toString()),
                              ReUsableRow(
                                  title: "cases",
                                  data: snapshot.data!.cases.toString()),
                              ReUsableRow(
                                  title: "recovered",
                                  data: snapshot.data!.recovered.toString()),
                              ReUsableRow(
                                  title: "active",
                                  data: snapshot.data!.active.toString()),
                              ReUsableRow(
                                  title: "tests",
                                  data: snapshot.data!.tests.toString()),
                              ReUsableRow(
                                  title: "population",
                                  data: snapshot.data!.population.toString()),
                              ReUsableRow(
                                  title: "affectedCountries",
                                  data: snapshot.data!.affectedCountries
                                      .toString()),
                              // ReUsableRow(
                              //     title: "todayRecovered",
                              //     data: snapshot.data!.todayRecovered
                              //         .toString()),
                            ],
                          )),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CountryListScreen(),
                                ));
                          },
                          child: const Text("track Country")),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  final String title, data;
  const ReUsableRow({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(data),
            ],
          ),
          const Divider(),
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}
