import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';
import 'package:stopwatch_flutter/ui/stopwatch_ticker_ui.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  final _tickerUIKey = GlobalKey<StopwatchTickerUIState>();
  bool _isRunning = false;

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
    });
    _tickerUIKey.currentState?.toggleRunning(_isRunning);
  }

  void _reset() {
    setState(() {
      _isRunning = false;
    });
    _tickerUIKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopwatchRenderer(
            radius: radius,
          ),
          StopwatchTickerUI(
            key: _tickerUIKey,
            radius: radius,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: ResetButton(
                onPressed: _reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: StartStopButton(
                isRunning: _isRunning,
                onPressed: _toggleRunning,
              ),
            ),
          ),
        ],
      );
    });
  }
}
