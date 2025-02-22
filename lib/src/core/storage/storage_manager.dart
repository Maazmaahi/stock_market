part of '../core.dart';

class StorageManger {
  static const StorageManger _instance = StorageManger._internal();
  final _storage = const FlutterSecureStorage();

  static const _tokenKey = "token";
  static const _userKey = "user";
  static const _themeKey = 'theme';

  factory StorageManger() {
    return _instance;
  }

  const StorageManger._internal();

  Future<void> storeTheme(String theme) async {
    await _storage.write(key: _themeKey, value: theme);
  }

  Future<String?> getTheme() async {
    return await _storage.read(key: _themeKey);
  }

  Future<void> deleteTheme() async {
    await _storage.delete(key: _themeKey);
  }

  Future<void> storeToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> storeUser(User user) async {
    final userJson = json.encode(user.toJson());
    await _storage.write(key: _userKey, value: userJson);
  }

  Future<User?> getUser() async {
    final userJson = await _storage.read(key: _userKey);
    if (userJson == null) return null;
    try {
      final userMap = json.decode(userJson);
      return User.fromJson(userMap);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteUser() async {
    await _storage.delete(key: _userKey);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
