import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'There is no weather😥 start',
            style: TextStyle(fontSize: 25),
          ),
          const Text(
            'Searching now🔎',
            style: TextStyle(fontSize: 25),
          ),
        ],
      )),
    );
  }
}
