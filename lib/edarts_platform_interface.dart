import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:edarts/edarts_method_channel.dart';

abstract class EdartsPlatform extends PlatformInterface {
  /// Constructs a EdartsPlatform.
  EdartsPlatform() : super(token: _token);

  static final Object _token = Object();

  static EdartsPlatform _instance = MethodChannelEdarts();

  /// The default instance of [EdartsPlatform] to use.
  ///
  /// Defaults to [MethodChannelEdarts].
  static EdartsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EdartsPlatform] when
  /// they register themselves.
  static set instance(EdartsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
