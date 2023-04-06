import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tiktok_app/app/app.router.dart';
import 'package:tiktok_app/di/locator.dart';
import 'package:tiktok_app/services/firebase_service.dart';

class AppBaseViewModel extends BaseViewModel {
  ThemeMode theme = ThemeMode.dark;
  final NavigationService navigationService = locator<NavigationService>();
  final FirebaseService firebaseService = locator<FirebaseService>();
  StreamSubscription<ConnectivityResult>? subscription;
  init() {
    listenConnectivity();
    firebaseService.init();
  }

  changeTheme() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
      CircularProgressIndicator(color: Colors.white);
    } else {
      theme = ThemeMode.dark;
      CircularProgressIndicator(color: Colors.white);
    }
    locator<AppBaseViewModel>().notifyListeners();
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    } else {
      navigationService.replaceWith(Routes.noConnectionView);
    }
  }

  listenConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        navigationService.replaceWith(Routes.homeView);
      } else {
        navigationService.replaceWith(Routes.noConnectionView);
      }
    });
  }
}
