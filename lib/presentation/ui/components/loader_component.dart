import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';

enum ELoaderComponentStyle { light, dark }

class LoaderComponent extends StatelessWidget {
  final ELoaderComponentStyle? style;
  final double? size;
  final String? loadingText;

  const LoaderComponent({Key? key, required this.style, this.size, this.loadingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorValue = style == ELoaderComponentStyle.light ? AppThemeColors.white : AppThemeColors.primary;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              color: colorValue,
              strokeWidth: 2.5,
            ),
          ),
          if ((loadingText ?? "").trim().isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
