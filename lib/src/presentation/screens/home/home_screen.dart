import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market/src/presentation/widgets/loading/loading_indicator.dart';

import '../../../core/core.dart';
import '../../providers/providers.dart';
import 'widgets/app_drawer.dart';
import 'widgets/stock_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch() {

  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(stockSearchProvider);
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Search', style: p22.bold),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for a stock...',
                  hintStyle: p16.copyWith(color: colorScheme.onSurface),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: Icon(Icons.clear, color: colorScheme.onSurface),
                          onPressed: () {
                            _searchController.clear();
                            context.dismissKeyboard();
                            ref
                                .read(stockSearchProvider.notifier)
                                .clearResults();
                          },
                        ),
                      IconButton(
                        icon: Icon(Icons.search, color: colorScheme.onSurface),
                        onPressed: () {
                          final query = _searchController.text.trim();
                          context.dismissKeyboard();
                          if (query.isNotEmpty) {
                            ref.read(stockSearchProvider.notifier).searchStocks(query);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                onSubmitted: (_) => _onSearch(),
              ),
            ),
            const SizedBox(height: 16),

            // Stock List
            Expanded(
              child: searchState.when(
                data: (stocks) => stocks.isEmpty
                    ? const Center(
                        child: Text(
                          'No stocks found',
                          style: p16,
                        ),
                      )
                    : ListView.separated(
                        itemCount: stocks.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          return StockCard(stock: stocks[index]);
                        },
                      ),
                loading: () => const LoadingIndicator(),
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error',
                      style: const TextStyle(color: AppColors.red)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
