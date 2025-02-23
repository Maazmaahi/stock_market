
import 'package:riverpod/riverpod.dart';

import '../../../data/models/stock_price_graph.dart';
import '../../../data/services/api_service.dart';
import '../providers.dart';

final stockGraphProvider =
    AsyncNotifierProvider<StockGraphNotifier, StockPriceGraph>(
        StockGraphNotifier.new);

class StockGraphNotifier extends AsyncNotifier<StockPriceGraph> {
  late final ApiService _apiService;

  @override
  Future<StockPriceGraph> build() async {
    _apiService = ref.read(apiServiceProvider);
    return Future.error("Stock ID and range required!"); // Initial empty state
  }

  // Fetch stock price graph
  Future<void> fetchStockGraph(int stockId, String range) async {
    try {
      state = const AsyncLoading();
      final stockGraph = await _apiService.getStockPriceGraph(stockId, range);
      state = AsyncData(stockGraph);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
