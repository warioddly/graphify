
library edarts;

export 'src/view/implements/facade.dart'
  if (dart.library.io) 'src/view/implements/mobile.dart'
  if (dart.library.html) 'src/view/implements/web.dart';

export 'src/controller/implements/facade.dart'
  if (dart.library.io) 'src/controller/implements/mobile.dart'
  if (dart.library.html) 'src/controller/implements/web.dart';


export 'src/utils/edarts_aware.dart';