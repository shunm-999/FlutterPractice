import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'view_map_method_channel.dart';

abstract class ViewMapPlatform extends PlatformInterface {
  /// Constructs a ViewMapPlatform.
  ViewMapPlatform() : super(token: _token);

  static final Object _token = Object();

  static ViewMapPlatform _instance = MethodChannelViewMap();

  /// The default instance of [ViewMapPlatform] to use.
  ///
  /// Defaults to [MethodChannelViewMap].
  static ViewMapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ViewMapPlatform] when
  /// they register themselves.
  static set instance(ViewMapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
