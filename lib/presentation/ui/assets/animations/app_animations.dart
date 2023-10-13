import 'package:flutter/foundation.dart';

enum EAppAnimations {
  noData,
}

extension XAppAnimationAssets on EAppAnimations {
  String get path => 'lib/presentation/ui/assets/animations/json/${describeEnum(this)}.json';
}
