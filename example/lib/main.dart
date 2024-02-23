import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:echarts/echarts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final EchartController controller = EchartController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Echarts Example'),
        ),
        body: Column(
          children: [
            Expanded(
              child: EchartView(
                controller: controller,
              ),
            ),
          ],
        ),
        floatingActionButton: EchartAware(
          debug: true,
          child: FloatingActionButton(
            onPressed: () {
              print(1111);
              controller.chartUpdate({});
            },
            child: const Icon(CupertinoIcons.circle_grid_hex),
          ),
        )
      ),
    );
  }
}
