import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:tiktok_app/app/app.router.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/constants/theme.dart';
import 'package:tiktok_app/di/locator.dart';

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppBaseViewModel>.reactive(
        viewModelBuilder: () => locator<AppBaseViewModel>(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => MaterialApp(
              theme: ThemeConst.light,
              darkTheme: ThemeConst.dark,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorObservers: const <NavigatorObserver>[],
              themeMode: locator<AppBaseViewModel>().theme,
            ));
  }
}
