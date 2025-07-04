
import 'package:graphify/src/utils/utils.dart';

mixin Disposable {
  void dispose();
}

abstract class GraphifyController with Disposable {

  /// Creates a new instance of [GraphifyController] with a unique identifier.
  GraphifyController() : uid = Utils.uid();

  /// Unique identifier for the chart instance.
  final String uid;

  /// Updates the chart with the provided options.
  void update(Map<String, dynamic>? options);

}