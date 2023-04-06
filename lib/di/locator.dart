import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/services/firebase_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => AppBaseViewModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirebaseService());
}
