import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/di/locator.dart';

class NoConnectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Device has no connection',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
