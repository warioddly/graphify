#include "include/echarts/echarts_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "echarts_plugin.h"

void EchartsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  echarts::EchartsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
