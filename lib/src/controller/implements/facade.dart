import 'package:graphify/src/controller/interface.dart' as controller_interface;

class GraphifyController implements controller_interface.GraphifyController {

  @override
  String uid = "";

  @override
  Future<void> update(Map<String, dynamic>? options) {
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }


}