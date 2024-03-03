import 'package:graphify/src/core/models/g_model.dart';

abstract class GraphifyController {


  String identifier = "";

  Future<void> update(GraphifyModel? options);

  Future<void> dispose();

  // Future<void> updateData(String options);


}