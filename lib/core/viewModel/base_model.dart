import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/core/enum/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState? _state;

  ViewState? get state => _state;

  void setState(ViewState? newState) {
    _state = newState;
    notifyListeners();
  }

  // final Service? _service = locator<ServiceImpl>();

  // final NavigationService? _navigationService = locator<NavigationService>();

  @override
  void dispose() {
    super.dispose();
  }
}
