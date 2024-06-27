import 'package:covid_19/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  TextEditingController searchController = TextEditingController();
  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: "Search with country name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ))),
          ),
          Expanded(
              child: FutureBuilder(
                  future: statesServices.fetchWorldCountry(),
                  builder: (content, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white))
                              ],
                            ));
                      });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var countryName = snapshot.data![index]["country"];

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  ListTile(
                                      title: Text(
                                          snapshot.data![index]["country"]),
                                      subtitle: Text(snapshot.data![index]
                                              ["cases"]
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ["countryInfo"]["flag"])))
                                ],
                              );
                            } else if (countryName.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ListTile(
                                      title: Text(
                                          snapshot.data![index]["country"]),
                                      subtitle: Text(snapshot.data![index]
                                              ["cases"]
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ["countryInfo"]["flag"])))
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
