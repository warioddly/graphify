import 'package:graphify/src/models/decals/g_decals.dart';
import 'package:graphify/src/models/interface.dart';

class GDecal extends GraphifyModel {

  const GDecal({
    super.show = true,
    this.decals = const GDecals(),
  });

  final GDecals decals;

  GDecal copyWith({
    bool? show,
    GDecals? decals,
  }) {
    return GDecal(
      show: show ?? this.show,
      decals: decals ?? this.decals,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'decals': decals.toJson(),
    };
  }

}

