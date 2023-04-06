import 'package:flutter/material.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/di/locator.dart';

class MyActionWidget extends StatelessWidget {
  void Function()? onPressed;
  MyActionWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: locator<AppBaseViewModel>().theme == ThemeMode.light
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode));
  }
}
