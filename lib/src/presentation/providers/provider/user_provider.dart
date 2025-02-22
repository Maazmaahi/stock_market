import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/core.dart';
import '../../../data/models/user.dart';

final userProvider = FutureProvider<User?>((ref) async {
  final storage = StorageManger();
  return storage.getUser();
});
