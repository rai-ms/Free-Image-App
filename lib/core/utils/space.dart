import 'package:flutter/material.dart';
import '../services/route_service/app_routing.dart';

abstract class Space {
  static const double _defaultHeight = 812.0;
  static const double _defaultWidth = 375.0;

  static double? _cachedHeight;
  static double? _cachedWidth;
  static double? _cachedPadBottom;
  static double? _cachedPadTop;
  static double? _cachedInsetsBottom;
  static double? _cachedInsetsTop;

  static BuildContext? get _context => RouteService.navigatorKey.currentContext;

  static double get h {
    try {
      if (_context?.mounted ?? false) {
        _cachedHeight = MediaQuery.sizeOf(_context!).height;
        return _cachedHeight!;
      }
      return _cachedHeight ?? _defaultHeight;
    } catch (_) {
      return _cachedHeight ?? _defaultHeight;
    }
  }

  static double rH(double height) {
    try {
      double screenHeight = h;
      return screenHeight * (height / 852);
    } catch (_) {
      return (_cachedHeight ?? _defaultHeight) * (height / 852);
    }
  }

  static double rW(double width) {
    try {
      double screenWidth = w;
      return (screenWidth * (width / 852)) * 100;
    } catch (_) {
      return (_cachedWidth ?? _defaultWidth) * (width / 852) * 100;
    }
  }

  static double rWW(double width) {
    try {
      double screenWidth = w;
      return (screenWidth * (width / 1440)) * 100;
    } catch (_) {
      return (_cachedWidth ?? _defaultWidth) * (width / 1440) * 100;
    }
  }

  static double get w {
    try {
      if (_context?.mounted ?? false) {
        _cachedWidth = MediaQuery.sizeOf(_context!).width;
        return _cachedWidth!;
      }
      return _cachedWidth ?? _defaultWidth;
    } catch (_) {
      return _cachedWidth ?? _defaultWidth;
    }
  }

  static double get padBottom {
    try {
      if (_context?.mounted ?? false) {
        _cachedPadBottom = MediaQuery.of(_context!).viewPadding.bottom;
        return _cachedPadBottom!;
      }
      return _cachedPadBottom ?? 0.0;
    } catch (_) {
      return _cachedPadBottom ?? 0.0;
    }
  }

  static double get padTop {
    try {
      if (_context?.mounted ?? false) {
        _cachedPadTop = MediaQuery.of(_context!).viewPadding.top;
        return _cachedPadTop!;
      }
      return _cachedPadTop ?? 0.0;
    } catch (_) {
      return _cachedPadTop ?? 0.0;
    }
  }

  static double get insetsBottom {
    try {
      if (_context?.mounted ?? false) {
        _cachedInsetsBottom = MediaQuery.of(_context!).viewInsets.bottom;
        return _cachedInsetsBottom!;
      }
      return _cachedInsetsBottom ?? 0.0;
    } catch (_) {
      return _cachedInsetsBottom ?? 0.0;
    }
  }

  static double insetsTop() {
    try {
      if (_context?.mounted ?? false) {
        _cachedInsetsTop = MediaQuery.of(_context!).viewInsets.top;
        return _cachedInsetsTop!;
      }
      return _cachedInsetsTop ?? 0.0;
    } catch (_) {
      return _cachedInsetsTop ?? 0.0;
    }
  }

  static SizedBox safeTop() => SizedBox(height: padTop);
  static SizedBox safeBottom() => SizedBox(height: padBottom);

  static SizedBox resH(double height, {double? defaultHeight}) =>
      SizedBox(height: h * (height / (defaultHeight ?? 852)));

  static SizedBox resW(double width, {double? defaultWidth}) =>
      SizedBox(width: w * (width / (defaultWidth ?? 393)));

  static void precache() {
    try {
      if (_context?.mounted ?? false) {
        _cachedHeight = MediaQuery.sizeOf(_context!).height;
        _cachedWidth = MediaQuery.sizeOf(_context!).width;
        _cachedPadBottom = MediaQuery.of(_context!).viewPadding.bottom;
        _cachedPadTop = MediaQuery.of(_context!).viewPadding.top;
        _cachedInsetsBottom = MediaQuery.of(_context!).viewInsets.bottom;
        _cachedInsetsTop = MediaQuery.of(_context!).viewInsets.top;
      }
    } catch (_) {}
  }

  static const SizedBox z = SizedBox.shrink();
  static const Spacer f = Spacer();
  static const SizedBox h2 = SizedBox(height: 2);
  static const SizedBox h3 = SizedBox(height: 3);
  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h5 = SizedBox(height: 5);
  static const SizedBox h6 = SizedBox(height: 6);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h10 = SizedBox(height: 10);
  static const SizedBox h12 = SizedBox(height: 12);
  static const SizedBox h14 = SizedBox(height: 14);
  static const SizedBox h15 = SizedBox(height: 15);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h18 = SizedBox(height: 18);
  static const SizedBox h20 = SizedBox(height: 20);
  static const SizedBox h22 = SizedBox(height: 22);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h25 = SizedBox(height: 25);
  static const SizedBox h26 = SizedBox(height: 26);
  static const SizedBox h28 = SizedBox(height: 28);
  static const SizedBox h30 = SizedBox(height: 30);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h34 = SizedBox(height: 34);
  static const SizedBox h36 = SizedBox(height: 36);
  static const SizedBox h40 = SizedBox(height: 40);
  static const SizedBox h44 = SizedBox(height: 44);
  static const SizedBox h45 = SizedBox(height: 45);
  static const SizedBox h48 = SizedBox(height: 48);
  static const SizedBox h50 = SizedBox(height: 50);
  static const SizedBox h56 = SizedBox(height: 56);
  static const SizedBox h60 = SizedBox(height: 60);
  static const SizedBox h66 = SizedBox(height: 66);
  static const SizedBox h72 = SizedBox(height: 72);
  static const SizedBox h90 = SizedBox(height: 90);
  static const SizedBox h100 = SizedBox(height: 100);
  static const SizedBox h120 = SizedBox(height: 120);
  static const SizedBox w3 = SizedBox(width: 3);
  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w5 = SizedBox(width: 5);
  static const SizedBox w6 = SizedBox(width: 6);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w10 = SizedBox(width: 10);
  static const SizedBox w12 = SizedBox(width: 12);
  static const SizedBox w14 = SizedBox(width: 14);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w20 = SizedBox(width: 20);
  static const SizedBox w22 = SizedBox(width: 22);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w30 = SizedBox(width: 30);
  static const SizedBox w40 = SizedBox(width: 40);
  static const SizedBox w44 = SizedBox(width: 44);
  static const SizedBox w50 = SizedBox(width: 50);
  static const SizedBox w60 = SizedBox(width: 60);
}
