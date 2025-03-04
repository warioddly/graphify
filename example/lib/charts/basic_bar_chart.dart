import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class BasicBarChart extends StatefulWidget {
  const BasicBarChart({super.key});

  @override
  State<BasicBarChart> createState() => _BasicBarChartState();
}

class _BasicBarChartState extends State<BasicBarChart> {

  final controller = GraphifyController();
  var _chartCreated = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      controller.update({
        "series": [
          {
            "data": Helper.randomData(7, 300),
          }
        ]
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        GraphifyView(
            controller: controller,
            onCreated: () async {
              await Future.delayed(const Duration(milliseconds: 400));
              setState(() {
                _chartCreated = true;
              });
            },
            initialOptions: const {
              'backgroundColor': 'transparent',
              "xAxis": {
                "type": "category",
                "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
              },
              "yAxis": {
                "type": "value"
              },
              "series": [
                {
                  "data": [120, 200, 150, 80, 70, 110, 130],
                  "type": "bar"
                }
              ],
            },
          ),

        if (!_chartCreated)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: SizedBox.square(
                  dimension: 100,
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.green,
                  ),
                )
              )
            ),
          ),

      ],
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

}
