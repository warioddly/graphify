import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/core/echart_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GraphifyController controller = GraphifyController();
  final GraphifyController controller2 = GraphifyController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Graphify Example'),
        ),
        body: Column(
          children: [

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GraphifyView(
                      controller: controller,
                      initialOptions: '''
                      {
                              tooltip: {
                                trigger: 'axis',
                                axisPointer: { type: 'cross' }
                              },
                              legend: {},
                              xAxis: [
                                {
                                  type: 'category',
                                  axisTick: {
                                    alignWithLabel: true
                                  },
                                  axisLabel: {
                                    rotate: 30
                                  },
                                  data: [
                                    'January',
                                    'February',
                                    'March',
                                    'April',
                                    'May',
                                    'June',
                                    'July',
                                    'August',
                                    'September',
                                    'October',
                                    'November',
                                    'December'
                                  ]
                                }
                              ],
                              yAxis: [
                                {
                                  type: 'value',
                                  name: 'Precipitation',
                                  min: 0,
                                  max: 250,
                                  position: 'right',
                                  axisLabel: {
                                    formatter: '{value} ml'
                                  }
                                },
                                {
                                  type: 'value',
                                  name: 'Temperature',
                                  min: 0,
                                  max: 25,
                                  position: 'left',
                                  axisLabel: {
                                    formatter: '{value} °C'
                                  }
                                }
                              ],
                              series: [
                                {
                                  name: 'Precipitation',
                                  type: 'bar',
                                  yAxisIndex: 0,
                                  data: [6, 32, 70, 86, 68.7, 100.7, 125.6, 112.2, 78.7, 48.8, 36.0, 19.3]
                                },
                                {
                                  name: 'Temperature',
                                  type: 'line',
                                  smooth: true,
                                  yAxisIndex: 1,
                                  data: [
                                    6.0,
                                    10.2,
                                    10.3,
                                    11.5,
                                    10.3,
                                    13.2,
                                    14.3,
                                    16.4,
                                    18.0,
                                    16.5,
                                    12.0,
                                    5.2
                                  ]
                                }
                              ]
                            }
                    ''',
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: GraphifyView(
                initialOptions: pieNest,
              ),
            ),

          ],
        ),
      ),
    );
  }




}
