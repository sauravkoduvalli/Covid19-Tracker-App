import 'package:covid19_tracker/models/world_status_model.dart';
import 'package:covid19_tracker/screens/countries_list.dart';
import 'package:covid19_tracker/services/status_services.dart';
import 'package:covid19_tracker/widgets/reusable_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatusScreen extends StatefulWidget {
  const WorldStatusScreen({Key? key}) : super(key: key);

  @override
  _WorldStatusScreenState createState() => _WorldStatusScreenState();
}

class _WorldStatusScreenState extends State<WorldStatusScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3500),
  );

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatusServices statesServices = StatusServices();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          title: const Text("Covid-19 Tracker"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                FutureBuilder(
                  future: statesServices.fetchWorldStatesData(),
                  builder: (context, AsyncSnapshot<WorldStatusModel> snapshot) {
                    if (snapshot.hasData) {
                      var cases = snapshot.data!.cases;
                      var recovered = snapshot.data!.recovered;
                      var death = snapshot.data!.deaths;
                      return Column(
                        children: [
                          // pie chart representation section
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: PieChart(
                              dataMap: {
                                "Total": double.parse(cases.toString()),
                                "Recovered": double.parse(recovered.toString()),
                                "Death": double.parse(death.toString()),
                              },
                              animationDuration: const Duration(milliseconds: 1500),
                              chartRadius: MediaQuery.of(context).size.width / 3,
                              chartType: ChartType.ring,
                              colorList: colorList,
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              legendOptions: const LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.left,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          // Covid details card
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.05,
                              horizontal: 0.0,
                            ),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: "Total",
                                      value: snapshot.data!.cases.toString()),
                                  ReusableRow(
                                      title: "Death",
                                      value: snapshot.data!.deaths.toString()),
                                  ReusableRow(
                                      title: "Recovered",
                                      value: snapshot.data!.recovered.toString()),
                                  ReusableRow(
                                      title: "Active",
                                      value: snapshot.data!.active.toString()),
                                  ReusableRow(
                                      title: "Critical",
                                      value: snapshot.data!.critical.toString()),
                                  ReusableRow(
                                      title: "Today Death",
                                      value:
                                          snapshot.data!.todayDeaths.toString()),
                                  ReusableRow(
                                      title: "Today Recovered",
                                      value: snapshot.data!.todayRecovered
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          // navigation button
                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: const CountriesListScreen(),
                                    type: PageTransitionType.fade,
                                  ),
                                );
                              },
                              child: const Text(
                                "Track Countries",
                                style: TextStyle(fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff1aa260),
                                // shape: const StadiumBorder(),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Align(
                        alignment: Alignment.center,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}