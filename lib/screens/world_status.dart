import 'package:flutter/material.dart';

class WorldStatusScreen extends StatefulWidget {
  const WorldStatusScreen({Key? key}) : super(key: key);

  @override
  _WorldStatusScreenState createState() => _WorldStatusScreenState();
}

class _WorldStatusScreenState extends State<WorldStatusScreen>
    with TickerProviderStateMixin {

  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3000),
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
    return Scaffold();
  }
}
