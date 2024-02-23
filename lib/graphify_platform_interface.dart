import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:graphify/graphify_method_channel.dart';

abstract class GraphifyPlatform extends PlatformInterface {
  /// Constructs a GraphifyPlatform.
  GraphifyPlatform() : super(token: _token);

  static final Object _token = Object();

  static GraphifyPlatform _instance = MethodChannelGraphify();

  /// The default instance of [GraphifyPlatform] to use.
  ///
  /// Defaults to [MethodChannelGraphify].
  static GraphifyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GraphifyPlatform] when
  /// they register themselves.
  static set instance(GraphifyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
