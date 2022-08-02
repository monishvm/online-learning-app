import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color colorMellowApricot = Color(0xFFFFBF74);
const Color colorYankeesBlueDark = Color(0xFF1E213E);
const Color colorYankeesBlue = Color.fromARGB(255, 40, 46, 74);

final TextStyle poppins = GoogleFonts.poppins();

extension Ex on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
}

extension ExPad on Widget {
  Widget get padded => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: this,
      );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
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
          ),
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
                    Expanded(
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
                    ),
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
        pi,
        pi,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(OnBoardingPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(OnBoardingPainter oldDelegate) => true;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorYankeesBlueDark,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back !',
                        style: poppins.copyWith(
                          color: Colors.grey.shade100,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Abishek,',
                        style: poppins.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Image.network(
                          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ).padded,
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.w * .71,
                    child: TextField(
                      style: poppins.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        fillColor: colorYankeesBlue,
                        filled: true,
                        hintText: 'Search for a course',
                        hintStyle: poppins.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorMellowApricot,
                      boxShadow: [
                        BoxShadow(
                          color: colorMellowApricot.withOpacity(0.4),
                          offset: const Offset(0, 6),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 30,
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ],
              ).padded,
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: poppins.copyWith(
                          color: Colors.grey.shade100,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See all',
                        style: poppins.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ).padded,
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 25);
                      },
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 20 : 0,
                            right: index == 4 ? 20 : 0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: colorYankeesBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(500),
                                  child: Center(
                                    child: Image.network(
                                      'https://cdn.icon-icons.com/icons2/2429/PNG/512/figma_logo_icon_147289.png',
                                      height: 45,
                                      width: 45,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Designer',
                                style: poppins.copyWith(
                                  color: Colors.grey.shade100,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 270,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 270,
                          width: 250,
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 0,
                            right: index == 2 ? 20 : 0,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorYankeesBlue,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: colorYankeesBlueDark,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                      'https://miro.medium.com/max/1400/0*oVmw18MYu5OANSwH.jpg'),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'UI/UX Design Beginner',
                                      style: poppins.copyWith(
                                        color: Colors.grey.shade300,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500),
                                              child: Image.network(
                                                'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Javin Paul',
                                          style: poppins.copyWith(
                                            color: Colors.grey.shade300,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$125.00',
                                          style: poppins.copyWith(
                                            color: colorMellowApricot,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 60,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.star_rate_rounded,
                                                color: Colors.yellow.shade500,
                                                size: 20,
                                              ),
                                              Text(
                                                '4.7',
                                                style: poppins.copyWith(
                                                  color: Colors.grey.shade300,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 20);
                      },
                      itemCount: 3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ongoing Course',
                        style: poppins.copyWith(
                          color: Colors.grey.shade100,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See all',
                        style: poppins.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ).padded,
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 190,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 190,
                          width: 250,
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 0,
                            right: index == 2 ? 20 : 0,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorYankeesBlue,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: colorYankeesBlueDark,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                      'https://miro.medium.com/max/1400/0*oVmw18MYu5OANSwH.jpg'),
                                ),
                              ),
                              Text(
                                'UI/UX Design Beginner',
                                style: poppins.copyWith(
                                  color: Colors.grey.shade300,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 20);
                      },
                      itemCount: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
