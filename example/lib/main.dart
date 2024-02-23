import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';

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
              child: GraphifyView(
                controller: controller,
              ),
            ),

            const Expanded(
              child: GraphifyView(),
            ),
          ],
        ),
        floatingActionButton: GraphifyAware(
          child: FloatingActionButton(
            onPressed: () {
              controller.update("""
                {
                    "title": {
                      "text": "3D Line Chart",
                      "subtext": "Line Chart in 3D"
                    },
                    "tooltip": {},
                    "backgroundColor": "#fff",
                    "visualMap": {
                      "show": false,
                      "dimension": 2,
                      "min": 0,
                      "max": 30,
                      "inRange": {
                        "color": [
                          "#313695",
                          "#4575b4",
                          "#d73027",
                          "#4575b4",
                          "#d73027",
                          "#a50026"
                        ]
                      }
                    },
                    "xAxis3D": {
                      "type": "value"
                    },
                    "yAxis3D": {
                      "type": "value"
                    },
                    "zAxis3D": {
                      "type": "value"
                    },
                    "grid3D": {
                      "viewControl": {
                        "projection": "orthographic"
                      }
                    },
                    "series": [
                      {
                        "type": "line3D",
                        "lineStyle": {
                          "width": 4
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
