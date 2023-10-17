import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/presentation/ui/assets/animations/app_animations.dart';

enum ELoaderType { circularLoading, animation }

enum ELoaderComponentStyle { light, dark }

class LoaderComponent extends StatelessWidget {
  final ELoaderType type;
  final ELoaderComponentStyle? style;
  final double? size;
  final String? loadingText;

  const LoaderComponent({Key? key, required this.type, required this.style, this.size, this.loadingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorValue = style == ELoaderComponentStyle.light ? AppThemeColors.white : AppThemeColors.blackLight;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          type == ELoaderType.circularLoading
              ? SizedBox(
                  height: size,
                  width: size,
                  child: CircularProgressIndicator(
                    key: key == null ? null : Key("${(key as ValueKey).value}_circular_progress"),
                    color: colorValue,
                    strokeWidth: 2.5,
                  ),
                )
              : Expanded(
                  child: Lottie.asset(
                    key: key == null ? null : Key("${(key as ValueKey).value}_lottie_animation"),
                    EAppAnimations.guitarMan.path,
                  ),
                ),
          if ((loadingText ?? "").trim().isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                loadingText!,
                textAlign: TextAlign.center,
                style: AppThemeTexts(context).p(color: colorValue),
              ),
            ),
        ],
      ),
    );
  }
}
