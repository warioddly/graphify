import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/features/widgets/scaffold_wrapper.dart';



class BasicLineChart extends StatefulWidget {
  
  const BasicLineChart({super.key});

  static const String title = 'Basic Line Chart';

  @override
  State<BasicLineChart> createState() => _BasicLineChartState();
}

class _BasicLineChartState extends State<BasicLineChart> {
  
  final controller = GraphifyController();

  @override
  void initState() {
    
    super.initState();
    
    // Helper.periodic((p0) {
    //   controller.update("""{ series: [ { data: ${Helper.randomData(12)} } ] } """);
    // });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return const ScaffoldWrapper(
      title: BasicLineChart.title,
      child: Column(
        children: [

          // const Expanded(
          //   child: GraphifyView(
          //     initialOptions: options,
          //   ),
          // ),

          // Expanded(
          //   child: GraphifyView(
          //     controller: controller,
          //     initialOptions: options
          //   ),
          // )

        ],
      ),
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
