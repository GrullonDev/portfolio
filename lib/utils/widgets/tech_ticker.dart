import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TechTicker extends StatefulWidget {
  const TechTicker({
    super.key,
    this.items = const [
      'FLUTTER SDK',
      'KOTLIN MULTIPLATFORM',
      'SWIFT UI',
      'CLEAN ARCHITECTURE',
      'CI / CD',
      'TESTING',
    ],
  });

  final List<String> items;

  @override
  State<TechTicker> createState() => _TechTickerState();
}

class _TechTickerState extends State<TechTicker>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _rowKey = GlobalKey();
  late final Ticker _ticker;
  double _rowWidth = 0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureRow());
  }

  void _measureRow() {
    final box = _rowKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && box.hasSize) {
      setState(() => _rowWidth = box.size.width);
    }
  }

  void _onTick(Duration elapsed) {
    if (!_scrollController.hasClients || _rowWidth <= 0) return;
    final next = _scrollController.offset + 0.4;
    if (next >= _rowWidth) {
      _scrollController.jumpTo(next - _rowWidth);
    } else {
      _scrollController.jumpTo(next);
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final row = _buildRow(key: _rowKey);

    return SizedBox(
      height: 32,
      child: ClipRect(
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [row, _buildRow(), _buildRow()],
        ),
      ),
    );
  }

  Widget _buildRow({Key? key}) {
    return Row(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in widget.items) _chip(item),
      ],
    );
  }

  Widget _chip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(width: 20),
          Icon(Icons.radio_button_checked,
              size: 6, color: const Color(0xFF7B61FF).withValues(alpha: 0.6)),
        ],
      ),
    );
  }
}
