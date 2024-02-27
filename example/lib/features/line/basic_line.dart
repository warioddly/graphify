import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/core/helpers.dart';
import 'package:graphify_example/features/widgets/scaffold_wrapper.dart';



class BasicLineChart extends StatefulWidget {
  
  const BasicLineChart({super.key});

  static const String title = 'Basic Line Chart';

  @override
  State<BasicLineChart> createState() => _BasicLineChartState();
}

class _BasicLineChartState extends State<BasicLineChart> {
  
  final controller = GraphifyController();
  static const String options = """
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
              type: 'line',
              smooth: true
            }
          ]
        }
      """;
  
  
  @override
  void initState() {
    
    super.initState();
    
    Helper.periodic((p0) {
      controller.update("""{ series: [ { data: ${Helper.randomData(12)} } ] } """);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: BasicLineChart.title,
      child: Column(
        children: [

          const Expanded(
            child: GraphifyView(
              initialOptions: options,
            ),
          ),

          Expanded(
            child: GraphifyView(
              controller: controller,
              initialOptions: options
            ),
          )

        ],
      ),
    );
  }
}
