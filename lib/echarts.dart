
import 'echarts_platform_interface.dart';

class Echarts {
  Future<String?> getPlatformVersion() {
    return EchartsPlatform.instance.getPlatformVersion();
  }
}
