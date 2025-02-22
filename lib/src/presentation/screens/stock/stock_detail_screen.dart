import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market/src/presentation/widgets/loading/loading_indicator.dart';

import '../../../core/core.dart';
import '../../../data/models/stock.dart';
import '../../providers/provider/stock_price_graph_provider.dart';
import 'widgets/line_chart_widget.dart';

class StockDetailScreen extends ConsumerStatefulWidget {
  final Stock stock;

  const StockDetailScreen({super.key, required this.stock});

  @override
  ConsumerState<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends ConsumerState<StockDetailScreen> {
  String selectedRange = "1D"; // Default range

  @override
  void initState() {
    super.initState();
    _fetchStockGraph();
  }

  void _fetchStockGraph() {
    Future.microtask(() {
      ref
          .read(stockGraphProvider.notifier)
          .fetchStockGraph(widget.stock.id, selectedRange);
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockGraphState = ref.watch(stockGraphProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.stock.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stock Price Graph (With Proper Error Handling)
              SizedBox(
                height: 300, // Graph container
                child: stockGraphState.when(
                  data: (graph) => LineChartWidget(graph: graph),
                  loading: () => const LoadingIndicator(),
                  error: (error, stackTrace) => _ErrorWidget(
                    errorMessage:
                        "Unable to load stock graph. Please try again.",
                    onRetry: _fetchStockGraph,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Time Range Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price Graph", style: p18.bold),
                  DropdownButton<String>(
                    value: selectedRange,
                    items: ["1D", "1W", "1M", "1Y", "5Y"]
                        .map((range) => DropdownMenuItem(
                              value: range,
                              child: Text(range),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null && value != selectedRange) {
                        setState(() {
                          selectedRange = value;
                        });
                        _fetchStockGraph(); // Fetch new data when range changes
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(widget.stock.name, style: p22.bold),
              const SizedBox(height: 8),
              Text("Symbol: ${widget.stock.symbol}", style: p16.grey),
              const SizedBox(height: 12),
              Text(widget.stock.description, style: p16),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Error Widget
class _ErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const _ErrorWidget({required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 50),
          const SizedBox(height: 10),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
