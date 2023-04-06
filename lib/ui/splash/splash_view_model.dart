import 'package:tiktok_app/app/app.router.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';

class SplashViewModel extends AppBaseViewModel {
  initialize() {
    Future<void>.delayed(const Duration(seconds: 2),
        () => navigationService.replaceWith(Routes.homeView));
  }
}
