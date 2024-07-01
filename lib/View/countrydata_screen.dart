import 'package:covid_19/View/world_states.dart';
import 'package:covid_19/widgets/information_row.dart';
import 'package:flutter/material.dart';

class CountryDataScreen extends StatelessWidget {
  dynamic index;
  dynamic snapshot;
  dynamic data;
  CountryDataScreen({required this.snapshot, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Country"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),
            ),
            Center(child: Text(snapshot.data![index]["country"])),
            Divider(
              height: 40,
              color: Theme.of(context).dividerColor,
              indent: 5,
              endIndent: 5,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  ReUsableRow(
                      title: "continent",
                      data: snapshot.data![index]["continent"].toString()),
                  ReUsableRow(
                      title: "updated",
                      data: snapshot.data![index]["updated"].toString()),
                  ReUsableRow(
                      title: "deaths",
                      data: snapshot.data![index]["cases"].toString()),
                  ReUsableRow(
                      title: "todayCases",
                      data: snapshot.data![index]["todayCases"].toString()),
                  ReUsableRow(
                      title: "todayDeaths",
                      data: snapshot.data![index]["todayDeaths"].toString()),
                  ReUsableRow(
                      title: "recovered",
                      data: snapshot.data![index]["recovered"].toString()),
                  ReUsableRow(
                      title: "todayRecovered",
                      data: snapshot.data![index]["todayRecovered"].toString()),
                  ReUsableRow(
                      title: "active",
                      data: snapshot.data![index]["active"].toString()),
                  ReUsableRow(
                      title: "tests",
                      data: snapshot.data![index]["tests"].toString()),
                  ReUsableRow(
                      title: "population",
                      data: snapshot.data![index]["population"].toString()),
                ],
              ),
            )

            // ListTile(
            //     title: Text(snapshot.data![index]["country"]),
            //     subtitle: Text(snapshot.data![index]["cases"].toString()),
            //     leading: Image(
            //         height: 50,
            //         width: 50,
            //         image: NetworkImage(
            //             snapshot.data![index]["countryInfo"]["flag"])))
          ],
        ),
      ),
    );
  }
}
