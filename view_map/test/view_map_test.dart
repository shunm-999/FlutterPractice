import 'package:flutter_test/flutter_test.dart';
import 'package:view_map/view_map.dart';
import 'package:view_map/view_map_platform_interface.dart';
import 'package:view_map/view_map_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockViewMapPlatform
    with MockPlatformInterfaceMixin
    implements ViewMapPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ViewMapPlatform initialPlatform = ViewMapPlatform.instance;

  test('$MethodChannelViewMap is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelViewMap>());
  });

  test('getPlatformVersion', () async {
    ViewMap viewMapPlugin = ViewMap();
    MockViewMapPlatform fakePlatform = MockViewMapPlatform();
    ViewMapPlatform.instance = fakePlatform;

    expect(await viewMapPlugin.getPlatformVersion(), '42');
  });
}
