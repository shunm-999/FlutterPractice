import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'view_map_platform_interface.dart';

/// An implementation of [ViewMapPlatform] that uses method channels.
class MethodChannelViewMap extends ViewMapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('view_map');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
