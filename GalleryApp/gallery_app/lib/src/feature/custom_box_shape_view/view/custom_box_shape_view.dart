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
        useMaterial3: false,
        primaryTextTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: AppFontSize.f20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w900)),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
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
            painter: CouponPainter(
                borderRadius: AppRadius.r4, backgroundColor: Colors.white),
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
  final Color backgroundColor;

  CouponPainter({
    super.repaint,
    required this.borderRadius,
    this.isHasDashLine = true,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeSolidPaint = Paint()
      ..colorFilter = const ColorFilter.linearToSrgbGamma()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1;
    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = backgroundColor;

    final Path couponTicket = Path();
    couponTicket.moveTo(borderRadius, 0);
    couponTicket.lineTo(100, 0);
    couponTicket.arcToPoint(const Offset(116, 0),
        radius: const Radius.circular(8), clockwise: false);
    couponTicket.lineTo(size.width - borderRadius, 0);
    couponTicket.arcToPoint(Offset(size.width, borderRadius),
        radius: Radius.circular(borderRadius), clockwise: true);
    couponTicket.lineTo(size.width, size.height - borderRadius);
    couponTicket.arcToPoint(Offset(size.width - borderRadius, size.height),
        radius: Radius.circular(borderRadius), clockwise: true);
    couponTicket.lineTo(116, size.height);
    couponTicket.arcToPoint(Offset(100, size.height),
        radius: const Radius.circular(8), clockwise: false);
    couponTicket.lineTo(borderRadius, size.height);
    couponTicket.arcToPoint(Offset(0, size.height - borderRadius),
        radius: Radius.circular(borderRadius), clockwise: true);
    couponTicket.lineTo(0, borderRadius);
    couponTicket.arcToPoint(Offset(borderRadius, 0),
        radius: Radius.circular(borderRadius), clockwise: true);
    couponTicket.close();

    canvas.drawShadow(couponTicket, Colors.black, 2, true);
    canvas.drawPath(couponTicket, fillPaint);

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
