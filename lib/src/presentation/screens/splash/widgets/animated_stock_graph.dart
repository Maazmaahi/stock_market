import 'package:flutter/material.dart';

import 'stock_graph_painter.dart';

class AnimatedStockGraph extends StatefulWidget {
  const AnimatedStockGraph({super.key});

  @override
  State<AnimatedStockGraph> createState() => _AnimatedStockGraphState();
}

class _AnimatedStockGraphState extends State<AnimatedStockGraph>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 50).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(200, 100),
          painter: StockGraphPainter(_animation.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
