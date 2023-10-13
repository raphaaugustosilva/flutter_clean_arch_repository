import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/presentation/ui/assets/images/app_images.dart';
import 'package:weather_forecast/presentation/ui/utils/keyboard_manager.dart';

class SearchBarComponent extends StatefulWidget {
  final Function() onSearchPressed;
  final Function(String value) onChanged;
  final Function() onCleanSearchPressed;
  final TextEditingController searchbarController;
  final bool isLoading;
  final String hintText;

  const SearchBarComponent({
    Key? key,
    required this.onSearchPressed,
    required this.onCleanSearchPressed,
    required this.onChanged,
    required this.searchbarController,
    required this.isLoading,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchBarComponent> createState() => _SearchBarStateComponent();
}

class _SearchBarStateComponent extends State<SearchBarComponent> {
  late bool _isCloseButtonVisible;

  @override
  void initState() {
    super.initState();
    _isCloseButtonVisible = false;
  }

  void handleCloseButtonVisibility() {
    setState(() {
      _isCloseButtonVisible = widget.searchbarController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    _isCloseButtonVisible = widget.searchbarController.text.isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 56,
          child: TextField(
            textInputAction: TextInputAction.search,
            autofocus: false,
            onChanged: (value) {
              handleCloseButtonVisibility();
              widget.onChanged(value);
            },
            onEditingComplete: () {
              KeyboardManager.hideKeyboard(context);
              widget.onSearchPressed();
            },
            maxLines: 1,
            controller: widget.searchbarController,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 20.5),
              fillColor: AppThemeColors.grayLightest,
              filled: true,
              isCollapsed: true,
              hintText: widget.hintText,
              hintStyle: AppThemeTexts(context).body(color: AppThemeColors.gray)?.w500,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 19.0, right: 8),
                child: SvgPicture.asset(
                  EAppImages.searchIcon.path(isSvg: true),
                ),
              ),
              suffixIcon: Visibility(
                visible: _isCloseButtonVisible,
                child: IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.close,
                    color: AppThemeColors.redDark.withOpacity(0.6),
                    size: 20,
                  ),
                  onPressed: () => {
                    widget.searchbarController.clear(),
                    widget.onCleanSearchPressed(),
                    handleCloseButtonVisibility(),
                  },
                ),
              ),
            ),
          ),
        ),
        if (widget.isLoading)
          const LinearProgressIndicator(
            backgroundColor: AppThemeColors.white,
            color: AppThemeColors.red,
          ),
      ],
    );
  }
}
