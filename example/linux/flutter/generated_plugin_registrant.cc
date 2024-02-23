//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <graphify/graphify_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) graphify_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GraphifyPlugin");
  graphify_plugin_register_with_registrar(graphify_registrar);
}
