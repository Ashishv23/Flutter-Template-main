import 'dart:convert';

import 'package:flutter_template/src/model/login/login/login_response.dart';
import 'package:flutter_template/src/utils/app_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _preferenceKeyLoggedIn = 'keyLoggedIn';
const _preferenceKeyLoginResponse = 'keyLoginResponse';

class SharedPreferenceRepository {
  Future<SharedPreferences> getSharedPrefInstance() async {
    var sharedPreferences =
        await SharedPreferences.getInstance().then((value) => value);
    return sharedPreferences;
  }

  void saveLoggedIn(bool value) {
    AppManager.sharedPreferences!.setBool(_preferenceKeyLoggedIn, value);
  }

  bool isLoggedIn() {
    return AppManager.sharedPreferences!.getBool(_preferenceKeyLoggedIn) ??
        false;
  }

  void saveLoginResponse(LoginResponse value) {
    AppManager.sharedPreferences!
        .setString(_preferenceKeyLoginResponse, json.encode(value));
  }

  LoginResponse getLoginResponse() {
    return LoginResponse.fromJson(json.decode(
        AppManager.sharedPreferences!.getString(_preferenceKeyLoginResponse)!));
  }

  void setInt(String key, int value) {
    AppManager.sharedPreferences!.setInt(key, value);
  }

  int? getInt(String key) {
    return AppManager.sharedPreferences!.getInt(key);
  }

  void clearAllData() {
    var pref = AppManager.sharedPreferences;
    pref!.clear();
  }
}
