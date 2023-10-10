import 'dart:ui';

enum EEnvType {
  dev("DEV"),
  prod("PROD");

  final String description;
  const EEnvType(this.description);
}

abstract interface class IEnvBaseConfig {
  String get baseUrlApi;
  String get apiClientId;
  EEnvType get type;
  String get label;
  Color get color;

  void setApiClientId(String value);
}
