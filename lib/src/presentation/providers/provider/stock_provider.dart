
import 'package:riverpod/riverpod.dart';

import '../../../data/models/stock.dart';
import '../../../data/services/api_service.dart';

class StockSearchState extends StateNotifier<AsyncValue<List<Stock>>> {
  StockSearchState(this.apiService) : super(const AsyncValue.data([]));

  final ApiService apiService;

  Future<void> searchStocks(String query) async {
    state = const AsyncValue.loading();
    try {
      final stocks = await apiService.searchStocks(query);
      state = AsyncValue.data(stocks);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void clearResults() {
    state = const AsyncValue.data([]); // Reset to empty list
  }
}

final stockSearchProvider =
    StateNotifierProvider<StockSearchState, AsyncValue<List<Stock>>>((ref) {
  return StockSearchState(ApiService());
});
