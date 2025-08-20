import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/src/theme/color/color_scheme.dart';

class CustomCurvedCard extends StatelessWidget {
  final Widget child;

  const CustomCurvedCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedCardClipper(),
      child: Container(
        width: 1.sw,
        height: 1.sw, // using your screen util size
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.shade800, // Dark navy
              AppColors.primary.shade700, // Deep purple
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}

class CurvedCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double curveHeight = 60.0;
    double curveWidth = 70.0;
    double borderRadius = 40.0;
    double edgeCurveDepth = 20.0;

    // Start from top-left corner
    path.moveTo(borderRadius, 0);
    path.lineTo(size.width / 2 - curveWidth - edgeCurveDepth, 0);

    // Left edge curve going down into the dip
    path.cubicTo(
      size.width / 2 - curveWidth,
      0,
      size.width / 2 - curveWidth * 0.9,
      curveHeight * 0.3,
      size.width / 2 - curveWidth * 0.5,
      curveHeight * 0.6,
    );

    // Middle dip curve
    path.quadraticBezierTo(
      size.width / 2,
      curveHeight,
      size.width / 2 + curveWidth * 0.5,
      curveHeight * 0.6,
    );

    // Right edge curve going back up
    path.cubicTo(
      size.width / 2 + curveWidth * 0.9,
      curveHeight * 0.3,
      size.width / 2 + curveWidth,
      0,
      size.width / 2 + curveWidth + edgeCurveDepth,
      0,
    );

    // Top right corner
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    // Bottom right corner
    path.lineTo(size.width, size.height - borderRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - borderRadius, size.height);

    // Bottom left corner
    path.lineTo(borderRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);

    // Top left corner
    path.lineTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
