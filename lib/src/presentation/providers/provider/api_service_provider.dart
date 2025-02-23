
import 'package:riverpod/riverpod.dart';

import '../../../data/services/api_service.dart';

// Provides an instance of ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
