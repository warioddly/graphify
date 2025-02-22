
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/models/charts/interface.dart';
import 'package:graphify/src/models/g_model.dart';


class GraphifyController implements controller_interface.GraphifyController {

  @override
  String identifier = "";

  @override
  Future<void> update(GraphifyModel? options) {
    throw UnimplementedError();
  }


  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }


  @override
  Future<void> updateSeries(List<GChartModel> series) {
    throw UnimplementedError();
  }


}