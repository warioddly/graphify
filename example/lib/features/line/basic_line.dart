import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';



class BasicLineChart extends StatelessWidget {
  const BasicLineChart({super.key});





  @override
  Widget build(BuildContext context) {
    return const GraphifyView(
      initialOptions: """
        {
          xAxis: {
            type: 'category',
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              data: [150, 230, 224, 218, 135, 147, 260],
              type: 'line'
            }
          ]
        }
      """,
    );
  }





}
