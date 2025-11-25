library graphify;

export 'src/controller/implements/facade.dart'
    if (dart.library.io) 'src/controller/implements/mobile.dart'
    if (dart.library.js_interop) 'src/controller/implements/web.dart';

export 'src/view/implements/facade.dart'
    if (dart.library.io) 'src/view/implements/mobile.dart'
    if (dart.library.js_interop) 'src/view/implements/web.dart';

export 'src/utils/gradient/_gradient.dart';
