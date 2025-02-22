
import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/features/widgets/scaffold_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const title = 'Graphify Examples';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final controller = GraphifyController();
  
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: HomeScreen.title,
      child: GraphifyView(
        controller: controller,
        ///   xAxis: {
        //     type: 'category',
        //     data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        //   },
        //   yAxis: {
        //     type: 'value'
        //   },
        //   series: [
        //     {
        //       data: [150, 230, 224, 218, 135, 147, 260],
        //       type: 'line'
        //     }
        //   ]
        initialOptions: const GraphifyModel(
          series: [
            GRadarChart(
              smooth: true,
              data: [
                {
                  'value': [4300, 10000, 28000, 35000, 50000, 19000],
                  'name': 'Budget',
                },
                {
                  'value': [5000, 14000, 28000, 31000, 42000, 21000],
                  'name': 'Income',
                }
              ],
            ),
          ],
        ),
      ),
    );
  }
}
