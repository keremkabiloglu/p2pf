import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveUserToken(String token) async {
    await logOutUser();
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token', token);
  }

  Future<String?> get getUserToken async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }

  Future<void> logOutUser() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove('token');
  }
}
