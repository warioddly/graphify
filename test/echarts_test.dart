import 'package:flutter_test/flutter_test.dart';
import 'package:echarts/echarts.dart';
import 'package:echarts/echarts_platform_interface.dart';
import 'package:echarts/echarts_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEchartsPlatform
    with MockPlatformInterfaceMixin
    implements EchartsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EchartsPlatform initialPlatform = EchartsPlatform.instance;

  test('$MethodChannelEcharts is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEcharts>());
  });

  test('getPlatformVersion', () async {
    Echarts echartsPlugin = Echarts();
    MockEchartsPlatform fakePlatform = MockEchartsPlatform();
    EchartsPlatform.instance = fakePlatform;

    expect(await echartsPlugin.getPlatformVersion(), '42');
  });
}
