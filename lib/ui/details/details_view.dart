import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/di/locator.dart';
import 'package:tiktok_app/ui/details/details_view_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
        viewModelBuilder: () => DetailViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        locator<AppBaseViewModel>().changeTheme();
                      },
                      icon: locator<AppBaseViewModel>().theme == ThemeMode.light
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode))
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Detail Pge',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ));
  }
}
