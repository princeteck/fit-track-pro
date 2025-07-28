import 'package:flutter/material.dart';

class HeartRateMonitor extends StatefulWidget {
  final int heartRate;
  final bool isMonitoring;

  const HeartRateMonitor({
    super.key,
    required this.heartRate,
    this.isMonitoring = false,
  });

  @override
  State<HeartRateMonitor> createState() => _HeartRateMonitorState();
}

class _HeartRateMonitorState extends State<HeartRateMonitor>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    if (widget.isMonitoring) {
      _startPulsing();
    }
  }

  void _startPulsing() {
    _pulseController.repeat(reverse: true);
  }

  void _stopPulsing() {
    _pulseController.stop();
    _pulseController.reset();
  }

  @override
  void didUpdateWidget(HeartRateMonitor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMonitoring != oldWidget.isMonitoring) {
      if (widget.isMonitoring) {
        _startPulsing();
      } else {
        _stopPulsing();
      }
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: Icon(Icons.favorite, color: Colors.red, size: 40),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.heartRate}',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'BPM',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.red.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
