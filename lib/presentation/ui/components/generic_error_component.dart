import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';

class GenericErrorComponent extends StatelessWidget {
  final String? errorText;
  final Function() tryAgainFunction;

  const GenericErrorComponent({
    Key? key,
    this.errorText,
    required this.tryAgainFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Column(
              children: [
                const Icon(
                  Icons.error,
                  size: 80,
                  color: AppThemeColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44),
                  child: Text(
                    errorText ?? "Sorry, we had a problem",
                    style: AppThemeTexts(context).subtitle()?.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: tryAgainFunction,
              child: const Text("Try again"),
            ),
          ],
        ),
      ),
    );
  }
}
