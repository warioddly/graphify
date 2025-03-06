
/// The interface for the Graphify controller.
///
/// Controllers are used to interact with the chart.
abstract class GraphifyController {

  /// The unique identifier of the chart.
  String get uid;

  /// Updates the chart with the given [options].
  void update(Map<String, dynamic>? options);

  /// Disposes the chart.
  void dispose();

}