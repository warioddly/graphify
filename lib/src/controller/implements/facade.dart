import 'package:graphify/src/controller/interface.dart' as controller_interface;

class GraphifyController implements controller_interface.GraphifyController {

  @override
  final String uid = "";

  @override
  void update(Map<String, dynamic>? options) {
    throw UnimplementedError("update() is not implemented");
  }

  @override
  void dispose() {
    throw UnimplementedError("dispose() is not implemented");
  }

}