import 'dart:async';

abstract class GraphifyController {

  String get uid;

  FutureOr<void> update(Map<String, dynamic>? options);

  FutureOr<void> dispose();

}