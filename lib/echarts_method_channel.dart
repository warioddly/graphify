import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'echarts_platform_interface.dart';

/// An implementation of [EchartsPlatform] that uses method channels.
class MethodChannelEcharts extends EchartsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('echarts');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
