import 'package:get_it/get_it.dart';
import 'package:password_manager/core/service/navigator/navigation_service.dart';
import 'package:password_manager/core/service/service.dart';
import 'package:password_manager/core/sharedpreference/preferences_service.dart';
import 'package:password_manager/core/viewModel/landing_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PreferencesServiceImpl());
  locator.registerLazySingleton(() => ServiceImpl());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => LandingViewModel());
}
