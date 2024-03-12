
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
    switch (this) {
      case GFontWeight.w100:
        return '100';
      case GFontWeight.w200:
        return '200';
      case GFontWeight.w300:
        return '300';
      case GFontWeight.w400:
        return '400';
      case GFontWeight.w500:
        return '500';
      case GFontWeight.w600:
        return '600';
      case GFontWeight.w700:
        return '700';
      case GFontWeight.w800:
        return '800';
      case GFontWeight.w900:
        return '900';
      default:
        return name;
    }
  }

}

enum GTextOverflow {
  none,
  truncate,
  breakAll,
  breaking;
  String get getName {
    switch (this) {
      case GTextOverflow.breaking:
        return 'break';
      default:
        return name;
    }
  }
}