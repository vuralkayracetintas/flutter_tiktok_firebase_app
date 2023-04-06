import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tiktok_app/di/locator.dart';
import 'package:tiktok_app/services/firebase_service.dart';

class AppBaseViewModel extends BaseViewModel {
  ThemeMode theme = ThemeMode.dark;
  final NavigationService navigationService = locator<NavigationService>();
  final FirebaseService firebaseService = locator<FirebaseService>();
  init() {
    firebaseService.init();
  }

  changeTheme() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
    } else {
      theme = ThemeMode.dark;
    }
    locator<AppBaseViewModel>().notifyListeners();
  }
}
