import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphify/graphify_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var platform = MethodChannelGraphify();
  const channel = MethodChannel('graphify');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
