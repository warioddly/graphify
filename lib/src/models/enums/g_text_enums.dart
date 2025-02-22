
enum GTextAlign {
  auto,
  left,
  right,
  center,
}

enum GTextAlignVertical {
  auto,
  top,
  bottom,
  middle,
}

enum GFontWeight {
  normal,
  bold,
  bolder,
  lighter,
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900;

  String get getName {
    return switch (this) {
      GFontWeight.w100 => '100',
      GFontWeight.w200 => '200',
      GFontWeight.w300 => '300',
      GFontWeight.w400 => '400',
      GFontWeight.w500 => '500',
      GFontWeight.w600 => '600',
      GFontWeight.w700 => '700',
      GFontWeight.w800 => '800',
      GFontWeight.w900 => '900',
      _ => name,
    };
  }

}

enum GTextOverflow {

  none,
  truncate,
  breakAll,
  breaking;

  String get getName {
    return switch (this) {
      GTextOverflow.breaking => 'break',
      _ => name,
    };
  }

}