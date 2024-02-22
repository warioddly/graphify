//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <echarts/echarts_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) echarts_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "EchartsPlugin");
  echarts_plugin_register_with_registrar(echarts_registrar);
}
