import 'package:password_manager/core/locator/locator.dart';
import 'package:password_manager/core/model/info.dart';
import 'package:password_manager/core/sharedpreference/preferences_service.dart';

abstract class Service {
  Future<Info?> getUserInfo();

  Future<bool> saveUserInfo({required Info? info});
}

class ServiceImpl implements Service {
  final PreferencesService? _preferencesService =
      locator<PreferencesServiceImpl>();

  @override
  Future<Info?> getUserInfo() async {
    return await _preferencesService!.getUserInfo();
  }

  @override
  Future<bool> saveUserInfo({required Info? info}) async {
    final bool _status =
        await _preferencesService?.saveUserInfo(info: info) ?? false;
    return _status;
  }
}
