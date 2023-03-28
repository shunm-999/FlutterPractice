
import 'view_map_platform_interface.dart';

class ViewMap {
  Future<String?> getPlatformVersion() {
    return ViewMapPlatform.instance.getPlatformVersion();
  }
}
