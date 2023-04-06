import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tiktok_app/ui/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        onViewModelReady: (model) => model.initialize(),
        viewModelBuilder: () => SplashViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Text(
                'Splash View',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          );
        });
  }
}
