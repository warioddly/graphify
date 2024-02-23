import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:edarts/edarts_platform_interface.dart';

/// An implementation of [EdartsPlatform] that uses method channels.
class MethodChannelEdarts extends EdartsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('edarts');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
