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
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
