#ifndef FLUTTER_PLUGIN_GRAPHIFY_PLUGIN_H_
#define FLUTTER_PLUGIN_GRAPHIFY_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace graphify {

class GraphifyPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  GraphifyPlugin();

  virtual ~GraphifyPlugin();

  // Disallow copy and assign.
  GraphifyPlugin(const GraphifyPlugin&) = delete;
  GraphifyPlugin& operator=(const GraphifyPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace graphify

#endif  // FLUTTER_PLUGIN_GRAPHIFY_PLUGIN_H_
