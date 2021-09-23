import 'package:flutter/material.dart';
import 'package:password_manager/core/locator/locator.dart';
import 'package:password_manager/core/model/info.dart';
import 'package:password_manager/core/service/service.dart';
import 'package:password_manager/core/viewModel/base_model.dart';

class LandingViewModel extends BaseModel {
  final Service _service = locator<ServiceImpl>();
  // final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController? websiteController,
      usernameController,
      passwordController;

  Info? info;

  List<Info> _infoList = [];

  List<Info> get infoList => _infoList;

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  set isPasswordVisible(bool isPasswordVisible) {
    _isPasswordVisible = isPasswordVisible;
    notifyListeners();
  }

  void toggleIsPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
  }

  Future deleteUserInfo(Info info) async {
    final bool isDeleted = await _service.deleteUserInfo(info: info);
    if (isDeleted) {
      _infoList.remove(info);
      notifyListeners();
    }
  }

  Future saveUserInfo(String website, String username, String password) async {
    await _service.saveUserInfo(
        info: Info(
      website: website,
      username: username,
      password: password,
    ));
  }

  Future getUserInfo() async {
    _infoList = await _service.getUserInfoList();
    notifyListeners();
  }
}
