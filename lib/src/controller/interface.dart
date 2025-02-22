import 'dart:async';

import 'package:graphify/graphify.dart';

abstract class GraphifyController {

  String identifier = "";

  FutureOr<void> update(GraphifyModel? options);

  FutureOr<void> updateSeries(List<GChartModel> series);

  FutureOr<void> dispose();

}