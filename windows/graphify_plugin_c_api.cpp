#include "include/graphify/graphify_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "graphify_plugin.h"

void GraphifyPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  graphify::GraphifyPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
