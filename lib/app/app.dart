import 'package:stacked/stacked_annotations.dart';
import 'package:tiktok_app/ui/no_connection_view/no_connection_view.dart';
import 'package:tiktok_app/ui/home/home_view.dart';
import 'package:tiktok_app/ui/splash/splash_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView),
  MaterialRoute(page: NoConnectionView),
  MaterialRoute(page: SplashView, initial: true)
])
class App {}
