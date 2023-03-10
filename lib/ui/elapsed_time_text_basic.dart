import 'package:flutter/material.dart';

class ElapsedTimeTextBasic extends StatelessWidget {
  const ElapsedTimeTextBasic({
    super.key,
    required this.elapsed,
  });
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minuteStr = minutes.toString().padLeft(2, '0');
    return Text(
      '$minuteStr:$secondsStr.$hundredsStr',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 40.0),
    );
  }
}
