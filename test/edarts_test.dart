// import 'package:flutter_test/flutter_test.dart';
// import 'package:edarts/edarts.dart';
// import 'package:edarts/edarts_platform_interface.dart';
// import 'package:edarts/edarts_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockEdartsPlatform
//     with MockPlatformInterfaceMixin
//     implements EdartsPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final EdartsPlatform initialPlatform = EdartsPlatform.instance;
//
//   test('$MethodChannelEdarts is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelEdarts>());
//   });
//
//   test('getPlatformVersion', () async {
//     Edarts edartsPlugin = Edarts();
//     MockEdartsPlatform fakePlatform = MockEdartsPlatform();
//     EdartsPlatform.instance = fakePlatform;
//
//     expect(await edartsPlugin.getPlatformVersion(), '42');
//   });
// }
