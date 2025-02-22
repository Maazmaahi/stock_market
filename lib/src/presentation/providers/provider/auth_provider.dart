import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market/src/data/services/api_service.dart';

import '../../../core/core.dart';
import '../../../data/models/user.dart';

class AuthState extends StateNotifier<AsyncValue<User?>> {
  AuthState(this.apiService) : super(const AsyncValue.data(null)) {
    checkLogin();
  }

  final ApiService apiService;
  final _storage = StorageManger();

  Future<void> login(String identifier, String password) async {
    state = const AsyncValue.loading();
    try {
      final userData = await apiService.login(identifier, password);
      state = AsyncValue.data(userData);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> logout() async {
    await _storage.deleteToken();
    await _storage.deleteUser();
    state = const AsyncValue.data(null);
  }

  Future<void> checkLogin() async {
    final token = await _storage.getToken();
    final user = await _storage.getUser();
    //refresh user data from API if needed.
    state = AsyncValue.data(user);
  }
}

final authProvider = StateNotifierProvider<AuthState, AsyncValue<User?>>((ref) {
  return AuthState(ApiService());
});
