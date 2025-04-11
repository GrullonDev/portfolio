import 'package:flutter/material.dart';

class Responsive {
  static const double _mobileBreakpoint = 600;
  static const double _tabletBreakpoint = 1200;

  static bool isMobile(BuildContext context) {
    return _getResponsiveSize(context) <= 400;
  }

  static bool isTablet(BuildContext context) {
    final size = _getResponsiveSize(context);
    return size > 400 && size <= 950;
  }

  static bool isDesktop(BuildContext context) {
    return _getResponsiveSize(context) > 950;
  }

  static double _getResponsiveSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < _mobileBreakpoint) {
      return 400;
    } else if (width >= _mobileBreakpoint && width < _tabletBreakpoint) {
      return 950; // Aumentado para mejor visualización en tablets
    }
    return 1200;
  }
}
