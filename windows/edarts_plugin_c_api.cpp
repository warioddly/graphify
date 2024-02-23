#include "include/edarts/edarts_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "edarts_plugin.h"

void EdartsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  edarts::EdartsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
