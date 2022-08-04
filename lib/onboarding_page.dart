import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

import './files.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BgImage(),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: context.h * .43,
                width: context.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Find the best Online\nCourse !',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(
                        color: Colors.grey.shade100,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: context.h * .05),
                    Text(
                      'Discover th best course and learn new professions from the confort home.',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                    ),
                    const MoveButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BgImage extends StatelessWidget {
  const BgImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: context.w,
      child: CustomPaint(
        foregroundPainter: OnBoardingPainter(),
        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            'https://img.freepik.com/free-photo/education-handsome-male-student-with-headphones-backpack-using-smartphone_1258-23917.jpg?w=996&t=st=1659457327~exp=1659457927~hmac=a04f5505426bf6bd29a73a12131e86d929a7ad27172535955112a333deeb50af',
            height: context.h * 0.6,
            width: context.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MoveButton extends StatelessWidget {
  const MoveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ));
        },
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                colorMellowApricot,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.4],
            ),
            boxShadow: [
              BoxShadow(
                color: colorMellowApricot.withOpacity(0.4),
                offset: const Offset(0, 8),
                blurRadius: 25,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.arrow_right_alt_rounded,
              size: 60,
              color: Colors.grey.shade100,
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Paint paint = Paint()
      ..color = colorYankeesBlueDark
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height * 0.5)
      ..addArc(
        Rect.fromCenter(center: Offset(w / 2, h), width: w * 2.3, height: h),
        math.pi,
        math.pi,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(OnBoardingPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(OnBoardingPainter oldDelegate) => true;
}
