// app_styles.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/app_colors.dart';

class AppStyles {
  // Poppins, 18px, 700, 27px line-height, 0.015em letter-spacing
  static final TextStyle pendingTaskPoppins70018 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      height: 27 / 18,
      letterSpacing: 0.015 * 18,
      color: Colors.black, // Specify color as needed
    ),
  );
  // Poppins, 18px, 700, 27px line-height, 0.015em letter-spacing
  static final TextStyle doneTaskPoppins70018 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      height: 27 / 18,
      letterSpacing: 0.015 * 18,
      color: AppColors.accentColor, // Specify color as needed
    ),
  );
  // Poppins, 18px, 700, 27px line-height, 0.015em letter-spacing
  static final TextStyle lightPoppins70018 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      height: 27 / 18,
      letterSpacing: 0.015 * 18,
      color: Colors.black, // Specify color as needed
    ),
  );
  // Poppins, 18px, 700, 27px line-height, 0.015em letter-spacing
  static final TextStyle darkPoppins70018 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      height: 27 / 18,
      letterSpacing: 0.015 * 18,
      color: Colors.white, // Specify color as needed
    ),
  );

  // Inter, 14px, 400, 16.94px line-height
  static final TextStyle inter40014 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 16.94 / 14,
      color: Colors.black, // Specify color as needed
    ),
  );

  // Light Poppins, 22px, 700, 33px line-height
  static final TextStyle lightPoppins70022 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
      height: 33 / 22,
      color: Colors.white, // Specify color as needed
    ),
  );
  // Dark Poppins, 22px, 700, 33px line-height
  static final TextStyle darkPoppins70022 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
      height: 33 / 22,
      color: Colors.black, // Specify color as needed
    ),
  );

  // Roboto, 12px, 400, 27px line-height, 0.015em letter-spacing
  static final TextStyle lightRoboto40012 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 27 / 12,
      letterSpacing: 0.015 * 12,
      color: Colors.black, // Specify color as needed
    ),
  );
  // Roboto, 12px, 400, 27px line-height, 0.015em letter-spacing
  static final TextStyle darkRoboto40012 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 27 / 12,
      letterSpacing: 0.015 * 12,
      color: Colors.white, // Specify color as needed
    ),
  );

  // Poppins, 14px, 700, 28px line-height
  static final TextStyle poppins70014 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      height: 28 / 14,
      color: Colors.black, // Specify color as needed
    ),
  );

  // Inter, 20px, 400, 24.2px line-height, text-align right
  static final TextStyle lightInter40020 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      height: 24.2 / 20,
      color: Colors.black, // Specify color as needed
    ),
  );

  static final TextStyle darkInter40020 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      height: 24.2 / 20,
      color: Colors.white, // Specify color as needed
    ),
  );

  // Inter, 18px, 400, 21.78px line-height, text-align right
  static final TextStyle inter40018 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      height: 21.78 / 18,
      color: Colors.black, // Specify color as needed
    ),
  );
}
