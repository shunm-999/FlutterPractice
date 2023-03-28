import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:view_map/view_map_method_channel.dart';

void main() {
  MethodChannelViewMap platform = MethodChannelViewMap();
  const MethodChannel channel = MethodChannel('view_map');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
