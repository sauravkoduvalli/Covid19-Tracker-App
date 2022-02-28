import 'package:covid19_tracker/widgets/reusable_row_widget.dart';
import 'package:flutter/material.dart';

class CountryDetailsScreen extends StatefulWidget {
  final String? countryName;
  final String? image;
  final int? totalCases,
      totalRecovered,
      totalDeaths,
      todayCases,
      todayDeaths,
      todayRecovered,
      active,
      critical;

  const CountryDetailsScreen({
    Key? key,
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
  }) : super(key: key);

  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(widget.countryName.toString()),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.image.toString()),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsCard(
                    titleTxt: "Today",
                    rowData: ReusableRow(
                      title: "Cases",
                      value: widget.todayCases.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String titleTxt;
  final ReusableRow rowData;

  const DetailsCard({
    Key? key,
    required this.titleTxt,
    required this.rowData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 5),
              child: Text(
                titleTxt,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),
          ],
        ),
      ),
    );
  }
}
