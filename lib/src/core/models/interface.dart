


abstract class GraphifyModel {

  const GraphifyModel({ this.show = false, this.id });

  Map<String, dynamic> toJson();

  /// Set this to false to prevent the title from showing
  final bool show;

  /// Component ID, not specified by default. If specified, it can be used to refer the component in option or API.
  final String? id;

}