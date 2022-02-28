import 'package:covid19_tracker/screens/country_details_screen.dart';
import 'package:covid19_tracker/services/status_services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  _CountriesListScreenState createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final TextEditingController searchController = TextEditingController();

  void clearSearchText() {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    StatusServices statusServices = StatusServices();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text("Countries"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                      suffixIcon: searchController.text.isNotEmpty ? IconButton(
                        icon: const Icon(Icons.clear,color: Colors.white70),
                        onPressed: clearSearchText,
                      ) : null,
                      hintText: "Search with country name",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(30),
                      ),

                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  child: FutureBuilder(
                    future: statusServices.fetchCountriesListApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            String countryName = snapshot.data![index]['country'];
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: CountryDetailsScreen(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'].toString(),
                                            countryName: snapshot.data![index]['country'],
                                            totalCases: snapshot.data![index]['totalCases'],
                                            active: snapshot.data![index]['active'],
                                            todayCases: snapshot.data![index]['todayCases'],
                                            totalDeaths: snapshot.data![index]['totalDeaths'],
                                            todayRecovered: snapshot.data![index]['todayRecovered'],
                                            totalRecovered: snapshot.data![index]['totalRecovered'],
                                            critical: snapshot.data![index]['critical'],
                                            todayDeaths: snapshot.data![index]['todayDeaths'],
                                          ),
                                          type: PageTransitionType.fade,
                                        ),
                                      ),
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 30,
                                        width: 50,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot.data![index]['countryInfo']
                                              ['flag'],
                                        ),
                                      ),
                                      title:
                                          Text(snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['countryInfo']['iso3']
                                          .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else if (countryName
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: CountryDetailsScreen(
                                            image: snapshot.data![index]
                                            ['countryInfo']['flag'].toString(),
                                            countryName: snapshot.data![index]['country'],
                                            totalCases: snapshot.data![index]['totalCases'],
                                            active: snapshot.data![index]['active'],
                                            todayCases: snapshot.data![index]['todayCases'],
                                            totalDeaths: snapshot.data![index]['totalDeaths'],
                                            todayRecovered: snapshot.data![index]['todayRecovered'],
                                            totalRecovered: snapshot.data![index]['totalRecovered'],
                                            critical: snapshot.data![index]['critical'],
                                            todayDeaths: snapshot.data![index]['todayDeaths'],
                                          ),
                                          type: PageTransitionType.fade,
                                        ),
                                      ),
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 30,
                                        width: 50,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot.data![index]['countryInfo']
                                              ['flag'],
                                        ),
                                      ),
                                      title: Text(snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['countryInfo']['iso3']
                                          .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, index) {
                            return Shimmer.fromColors(
                              highlightColor: Colors.grey.shade700,
                              baseColor: Colors.grey.shade300,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 30,
                                      width: 50,
                                      color: Colors.white70,
                                    ),
                                    title: Container(
                                      height: 10,
                                      width: double.infinity,
                                      color: Colors.white70,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: double.infinity,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
