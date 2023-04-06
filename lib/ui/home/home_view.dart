import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tiktok_app/app/app.router.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/di/locator.dart';
import 'package:tiktok_app/ui/home/home_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
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
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello from my app',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '${FirebaseAuth.instance.currentUser?.isAnonymous}',
                      ),
                      ElevatedButton(
                        onPressed: () {
                          model.navigationService.navigateTo(Routes.detailView);
                        },
                        child: const Text(
                          'Go to new page ',
                        ),
                      ),
                      model.videos == null
                          ? Container()
                          : Container(
                              height: 700,
                              child: WebView(
                                initialUrl: model.videos?.first.videoUrl,
                                allowsInlineMediaPlayback: true,
                                initialMediaPlaybackPolicy:
                                    AutoMediaPlaybackPolicy.always_allow,
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ));
  }
}
