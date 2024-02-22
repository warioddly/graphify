import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'echarts_method_channel.dart';

abstract class EchartsPlatform extends PlatformInterface {
  /// Constructs a EchartsPlatform.
  EchartsPlatform() : super(token: _token);

  static final Object _token = Object();

  static EchartsPlatform _instance = MethodChannelEcharts();

  /// The default instance of [EchartsPlatform] to use.
  ///
  /// Defaults to [MethodChannelEcharts].
  static EchartsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EchartsPlatform] when
  /// they register themselves.
  static set instance(EchartsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
