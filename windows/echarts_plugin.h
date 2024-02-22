#ifndef FLUTTER_PLUGIN_ECHARTS_PLUGIN_H_
#define FLUTTER_PLUGIN_ECHARTS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace echarts {

class EchartsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EchartsPlugin();

  virtual ~EchartsPlugin();

  // Disallow copy and assign.
  EchartsPlugin(const EchartsPlugin&) = delete;
  EchartsPlugin& operator=(const EchartsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace echarts

#endif  // FLUTTER_PLUGIN_ECHARTS_PLUGIN_H_
