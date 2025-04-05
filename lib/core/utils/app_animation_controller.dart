import 'dart:developer';

import 'package:flutter/cupertino.dart';

class AppAnimationController extends AnimationController {
  AppAnimationController({
    super.duration,
    required super.vsync,
  });

  /// Holds the status of Animation controller.
  bool active = true;

  @override
  void stop({bool canceled = true}) {
    try {
      if (active) {
        super.stop(canceled: canceled);
      }
    } catch (e) {
      log('Controller Already Disposed. From stop');
    }
  }

  @override
  void reset() {
    try {
      if (active) {
        super.reset();
      }
    } catch (e) {
      log('Controller Already Disposed. From reset');
    }
  }

  @override
  TickerFuture repeat({double? min, double? max, bool reverse = false, Duration? period, int? count}) {
    if (active) {
      return super.repeat(min: min, max: max, reverse: reverse, period: period);
    } else {
      return TickerFuture.complete();
    }
  }

  @override
  void dispose() {
    try {
      if (active) {
        active = false;
        super.dispose();
      }
    } catch (e) {
      log('Controller Already Disposed. From dispose');
    }
  }

  @override
  TickerFuture forward({double? from}) {
    if (active) {
      return super.forward(from: from);
    } else {
      return TickerFuture.complete();
    }
  }

  TickerFuture? safeForward({double? from}) {
    try {
      return forward(from: from);
    } catch (e) {
      log('Controller Already Disposed. From forward');
    }
    return null;
  }

  TickerFuture? safeRepeat(
      {double? min, double? max, bool reverse = false, Duration? period}) {
    try {
      return super.repeat(min: min, max: max, reverse: reverse, period: period);
    } catch (e) {
      log('Controller Already Disposed. From repeat');
    }
    return null;
  }
}
