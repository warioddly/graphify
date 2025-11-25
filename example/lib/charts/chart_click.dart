import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';

class ChartClick extends StatefulWidget {
  const ChartClick({super.key});

  @override
  State<ChartClick> createState() => _ChartClickState();
}

class _ChartClickState extends State<ChartClick> {
  late final GraphifyController _controller;
  String _status = 'Ready to test clicks';

  @override
  void initState() {
    super.initState();
    _controller = GraphifyController();
    _controller.chartClickedEvent.listen((data) {
      debugPrint('listener received: $data');
      setState(() {
        _status = 'Click received: ${data['name'] ?? 'Unknown'}';
      });

      log('TEST: Chart click received: $data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _status,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: 400,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: GraphifyView(
            controller: _controller,
            onConsoleMessage: (msg) {
              debugPrint('WebView console: ${(msg as dynamic).message}');
            },
            initialOptions: const {
              "tooltip": {
                "trigger": "axis",
                "axisPointer": {"type": "shadow"}
              },
              "legend": {
                "data": ["Sales", "Marketing"]
              },
              "xAxis": {
                "type": "category",
                "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
              },
              "yAxis": {"type": "value"},
              "series": [
                {
                  "name": "Sales",
                  "type": "bar",
                  "data": [120, 200, 150, 80, 70, 110, 130],
                  "itemStyle": {"color": "#5470c6"}
                },
                {
                  "name": "Marketing",
                  "type": "bar",
                  "data": [60, 100, 75, 40, 35, 55, 65],
                  "itemStyle": {"color": "#91cc75"}
                }
              ]
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
