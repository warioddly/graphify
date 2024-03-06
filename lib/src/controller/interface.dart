import 'package:graphify/graphify.dart';

abstract class GraphifyController {

  String identifier = "";

  Future<void> update(GraphifyModel? options);

  Future<void> updateSeries(List<GChartModel> series);

  Future<void> dispose();

  // Future<void> updateData(String options);

}