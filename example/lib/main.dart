import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edarts/edarts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final EdartController controller = EdartController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edarts Example'),
        ),
        body: Column(
          children: [
            Expanded(
              child: EdartView(
                controller: controller,
              ),
            ),
          ],
        ),
        floatingActionButton: EdartAware(
          child: FloatingActionButton(
            onPressed: () {
              controller.update("""
                {
                  tooltip: {},
                  backgroundColor: '#fff',
                  visualMap: {
                    show: false,
                    dimension: 2,
                    min: 0,
                    max: 30,
                    inRange: {
                      color: [
                        '#313695',
                        '#4575b4',
                        '#a50026'
                      ]
                    }
                  },
                  xAxis3D: {
                    type: 'value'
                  },
                  yAxis3D: {
                    type: 'value'
                  },
                  zAxis3D: {
                    type: 'value'
                  },
                  grid3D: {
                    viewControl: {
                      projection: 'orthographic'
                    }
                  },
                  series: [
                    {
                      type: 'line3D',
                      data: data,
                      lineStyle: {
                        width: 4
                      }
                    }
                  ]
                }
              """);
            },
            child: const Icon(CupertinoIcons.circle_grid_hex),
          ),
        )
      ),
    );
  }
}
