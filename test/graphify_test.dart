// import 'package:flutter_test/flutter_test.dart';
// import 'package:graphify/graphify.dart';
// import 'package:graphify/graphify_platform_interface.dart';
// import 'package:graphify/graphify_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockGraphifyPlatform
//     with MockPlatformInterfaceMixin
//     implements GraphifyPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final GraphifyPlatform initialPlatform = GraphifyPlatform.instance;
//
//   test('$MethodChannelGraphify is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelGraphify>());
//   });
//
//   test('getPlatformVersion', () async {
//     Graphify graphifyPlugin = Graphify();
//     MockGraphifyPlatform fakePlatform = MockGraphifyPlatform();
//     GraphifyPlatform.instance = fakePlatform;
//
//     expect(await graphifyPlugin.getPlatformVersion(), '42');
//   });
// }
