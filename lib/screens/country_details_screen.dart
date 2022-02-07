import 'package:flutter/material.dart';

class CountryDetailsScreen extends StatefulWidget {
  String? countryName;
  String? image;
  int? totalCases,
      totalRecovered,
      totalDeaths,
      todayCases,
      todayDeaths,
      todayRecovered,
      active,
      critical;

  CountryDetailsScreen({
    required this.countryName,
    required this.image,
    required this.totalCases,
    required this.totalRecovered,
    required this.totalDeaths,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
    required this.active,
    required this.critical,
  });

  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName.toString()),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.image.toString()),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
