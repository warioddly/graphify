
import 'package:graphify/src/utils/uid.dart';


abstract class GraphifyController {

  /// Creates a new instance of [GraphifyController] with a unique identifier.
  GraphifyController() : uid = UID.generate();

  /// Unique identifier for the chart instance.
  final String uid;

  /// Updates the chart with the provided options.
  void update(Map<String, dynamic>? options);

  /// Disposes of the chart instance, cleaning up resources.
  void dispose();

}