import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';

class CustomBoxShapeView extends StatelessWidget {
  const CustomBoxShapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        primaryTextTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: AppFontSize.f20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w900)),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Column(
          children: [_renderAppBar(), Expanded(child: _renderBody(context))],
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.customBoxShape,
      leading: IconButton(
        onPressed: () => AppCoordinator.showDashboardScreen(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: CustomPaint(
            size: const Size(double.infinity, 100),
            painter: CouponPainter(borderRadius: AppRadius.r4),
            child: Row(
              children: [
                _renderMoney(),
                const SizedBox(width: AppPadding.p36),
                _renderDetailCoupon(context),
                Radio(value: 0, groupValue: 1, onChanged: (value) {})
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _renderMoney() {
    return Container(
      width: AppSize.s70,
      height: AppSize.s70,
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      margin: const EdgeInsets.symmetric(
          vertical: AppMargin.m15, horizontal: AppMargin.m15),
      child: const Center(
        child: Text(
          '10k',
          style: TextStyle(fontSize: AppFontSize.f24),
        ),
      ),
    );
  }

  Widget _renderDetailCoupon(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'GIOITHIEU',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: AppFontSize.f24,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text('Giảm giá 12k cho đơn hàng'),
        const Text(
          'Kết thúc: 31/12/2023',
          style: TextStyle(color: Colors.grey),
        )
      ],
    ));
  }
}

class CouponPainter extends CustomPainter {
  final double borderRadius;
  final bool isHasDashLine;

  CouponPainter(
      {super.repaint, required this.borderRadius, this.isHasDashLine = true});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeSolidPaint = Paint()
      ..colorFilter = const ColorFilter.linearToSrgbGamma()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1;
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(borderRadius, borderRadius), radius: borderRadius),
        pi,
        pi / 2,
        false,
        strokeSolidPaint);
    canvas.drawLine(
        Offset(borderRadius, 0), const Offset(100, 0), strokeSolidPaint);
    canvas.drawArc(Rect.fromCircle(center: const Offset(108, 0), radius: 8), 0,
        pi, false, strokeSolidPaint);
    canvas.drawLine(const Offset(116, 0), Offset(size.width - borderRadius, 0),
        strokeSolidPaint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width - borderRadius, borderRadius), radius: 4),
        3 * pi / 2,
        pi / 2,
        false,
        strokeSolidPaint);
    canvas.drawLine(Offset(size.width, borderRadius),
        Offset(size.width, size.height - borderRadius), strokeSolidPaint);
    canvas.drawArc(
        Rect.fromCircle(
            center:
                Offset(size.width - borderRadius, size.height - borderRadius),
            radius: borderRadius),
        0,
        pi / 2,
        false,
        strokeSolidPaint);
    canvas.drawLine(Offset(size.width - borderRadius, size.height),
        Offset(116, size.height), strokeSolidPaint);
    canvas.drawArc(Rect.fromCircle(center: Offset(108, size.height), radius: 8),
        pi, pi, false, strokeSolidPaint);
    canvas.drawLine(Offset(100, size.height), Offset(borderRadius, size.height),
        strokeSolidPaint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(borderRadius, size.height - borderRadius),
            radius: borderRadius),
        pi / 2,
        pi / 2,
        false,
        strokeSolidPaint);
    canvas.drawLine(Offset(0, size.height - borderRadius),
        Offset(0, borderRadius), strokeSolidPaint);
    if (isHasDashLine) {
      _drawDashedLine(canvas, size, strokeSolidPaint,
          offsetStart: const Offset(108, 10),
          offsetStop: const Offset(108, 90));
    }
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint,
      {required Offset offsetStart, required Offset offsetStop}) {
    const int dashWidth = 4;
    const int dashSpace = 4;

    double startX = offsetStart.dx;
    double startY = offsetStart.dy;
    double stopX = offsetStop.dx;
    double stopY = offsetStop.dy;

    while (startY < stopY) {
      canvas.drawLine(
          Offset(startX, startY), Offset(stopX, startY + dashWidth), paint);
      startY += dashSpace + dashWidth;
    }
  }
}
