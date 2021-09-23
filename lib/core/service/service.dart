import 'package:password_manager/core/locator/locator.dart';
import 'package:password_manager/core/model/info.dart';
import 'package:password_manager/core/sharedpreference/preferences_service.dart';

abstract class Service {
  Future<List<Info>> getUserInfoList();

  Future<bool> saveUserInfo({required Info info});

  Future<bool> deleteUserInfo({required Info info});
}

class ServiceImpl implements Service {
  final PreferencesService? _preferencesService =
      locator<PreferencesServiceImpl>();

  @override
  Future<List<Info>> getUserInfoList() async {
    return await _preferencesService!.getUserInfoList();
  }

  @override
  Future<bool> saveUserInfo({required Info info}) async {
    final bool _status = await _preferencesService!.saveUserInfo(info: info);
    return _status;
  }

  @override
  Future<bool> deleteUserInfo({required Info info}) async {
    final bool _status = await _preferencesService!.deleteUserInfo(info: info);
    return _status;
  }
}
