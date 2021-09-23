import 'dart:async';
import 'dart:convert';

import 'package:password_manager/core/model/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  Future<String?> getString({required String key});

  Future<bool> setString({required String key, required String value});

  Future<bool> saveUserInfo({required Info info});

  Future<bool> saveUserInfoArray({required List<Info> infoList});

  Future<List<Info>> getUserInfoList();

  Future<bool> deleteUserInfo({required Info info});
}

class PreferencesServiceImpl implements PreferencesService {
  static const userInfo = 'user_info';
  static const userInfoList = 'user_info_list';
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Future<bool> setString({required String key, required String value}) async {
    final SharedPreferences pref = await prefs;
    return await pref.setString(key, value);
  }

  @override
  Future<String?> getString({required String key}) async {
    final SharedPreferences pref = await prefs;
    return pref.getString(key);
  }

  @override
  Future<bool> saveUserInfo({required Info info}) async {
    List<Info> infoList = await getUserInfoList();
    infoList.add(info);
    return await saveUserInfoArray(infoList: infoList);
  }

  @override
  Future<bool> saveUserInfoArray({required List<Info> infoList}) async {
    final SharedPreferences pref = await prefs;
    final String jsonEncoded =
        jsonEncode(infoList.map((info) => info.toJson()).toList());

    return await pref.setString(userInfoList, jsonEncoded);
  }

  @override
  Future<List<Info>> getUserInfoList() async {
    final SharedPreferences pref = await prefs;
    final String? jsonInfoList = pref.getString(userInfoList);

    if (jsonInfoList != null) {
      final dynamicList = jsonDecode(jsonInfoList);
      final infoList =
          List<Info>.from(dynamicList.map((m) => Info.fromJson(m)));
      return infoList;
    }
    return [];
  }

  @override
  Future<bool> deleteUserInfo({required Info info}) async {
    List<Info> infoList = await getUserInfoList();
    infoList.removeWhere((i) {
      if (i.website == info.website &&
          i.username == info.username &&
          i.password == info.password) {
        return true;
      }
      return false;
    });
    return await saveUserInfoArray(infoList: infoList);
  }
}
