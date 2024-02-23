//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <edarts/edarts_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) edarts_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "EdartsPlugin");
  edarts_plugin_register_with_registrar(edarts_registrar);
}
