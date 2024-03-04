
import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/features/widgets/scaffold_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const title = 'Graphify Examples';

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWrapper(
      title: title,
      child: GraphifyView(
        initialOptions: GraphifyModel(
          title: GTitle(
            show: false,
            text: 'Graphify Line Chart Example',
            textStyle: GTextStyle(
              color: '#fff',
              fontSize: 33,
            ),
            bottom: '10',
            left: '10',
          ),
          grid: GGrid(
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          ),
          xAxis: GAxis(
            show: false,
              data: [
                GAxisData(value: 'Mon'),
                GAxisData(value: 'Tue'),
                GAxisData(value: 'Wed'),
                GAxisData(value: 'Thu'),
                GAxisData(value: 'Fri'),
                GAxisData(value: 'Sat'),
                GAxisData(value: 'Sun'),
              ]
          ),
          yAxis: GAxis(
              data: [
                GAxisData(value: 'Mon'),
                GAxisData(value: 'Tue'),
                GAxisData(value: 'Wed'),
                GAxisData(value: 'Thu'),
                GAxisData(value: 'Fri'),
                GAxisData(value: 'Sat'),
                GAxisData(value: 'Sun'),
              ]
          ),
          series: [

            GLineChart(
                smooth: true,
                data: [1, 2, 5, 1, 3, 4, 1],
                name: 'Union Ads',
                stack: 'total',
                emphasis: GEmphasis(
                  focus: 'self',
                  blurScope: 'coordinateSystem',
                ),
            ),

            // GBarChart(
            //     name: 'Union Ads 2',
            //     stack: 'total',
            //     data: [1, 2, 5, 1, 3, 4, 1],
            // ),
            //
            GGaugeChart(
                name: 'Union Ads 3',
                data: [55],
                zLevel: GZLevel(z: 12),
            ),
            //
            // GGraphChart(
            //     name: 'Union Ads 5',
            //     data: [5, 3, 5, 6, 7, 8],
            //     zLevel: GZLevel(z: 12),
            //     symbolSize: Size.fromRadius(50),
            // ),

          ],
        ),
      ),
      // child: Center(
      //   child: ConstrainedBox(
      //     constraints: const BoxConstraints(maxWidth: 800),
      //     child: SingleChildScrollView(
      //       physics: const BouncingScrollPhysics(),
      //       child: Column(
      //         children: List.generate(30, (index) => Card(
      //           child: ListTile(
      //             title: Text('Item $index'),
      //             onTap: () => context.go('/basic-line'),
      //           ),
      //         )).toList(),
      //       ),
      //     ),
      //   ),
      // )
    );
  }

}
