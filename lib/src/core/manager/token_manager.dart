import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TokenManager {
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static SharedPreferences? _prefs;

  static Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<String?> getToken() async {
    await _initPrefs();
    return _prefs?.getString(_tokenKey);
  }

  static Future<bool> refreshToken() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return false;

      final idTokenResult = await user.getIdTokenResult(true);
      await _prefs?.setString(_tokenKey, idTokenResult.token!);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> clearToken() async {
    try {
      await _initPrefs();
      await _prefs?.remove(_tokenKey);
      return true;
    } catch (e) {
      return false;
    }
  }
}
