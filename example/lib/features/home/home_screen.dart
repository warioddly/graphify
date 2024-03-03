
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
          xAxis: GAxis(
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
              data: [1, 2, 5, 1, 3, 4, 1]
            ),

            GBarChart(
                data: [1, 2, 5, 1, 3, 4, 1]
            )

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
