import 'package:flutter/foundation.dart';

enum EAppImages {
  logoLight,
  searchIcon,
}

extension XAppImageAssets on EAppImages {
  String path({bool isSvg = false}) {
    String imageType = isSvg ? "svg" : "png";
    return 'lib/presentation/ui/assets/images/$imageType/${describeEnum(this)}.$imageType';
  }
}
