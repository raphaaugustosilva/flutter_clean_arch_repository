import 'package:flutter/foundation.dart';

enum EAppAnimations {
  guitarMan,
  noData,
}

extension XAppAnimationAssets on EAppAnimations {
  String get path => 'lib/presentation/ui/assets/animations/json/${describeEnum(this)}.json';
}
