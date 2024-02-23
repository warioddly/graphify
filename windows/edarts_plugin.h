#ifndef FLUTTER_PLUGIN_EDARTS_PLUGIN_H_
#define FLUTTER_PLUGIN_EDARTS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace edarts {

class EdartsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EdartsPlugin();

  virtual ~EdartsPlugin();

  // Disallow copy and assign.
  EdartsPlugin(const EdartsPlugin&) = delete;
  EdartsPlugin& operator=(const EdartsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace edarts

#endif  // FLUTTER_PLUGIN_EDARTS_PLUGIN_H_
