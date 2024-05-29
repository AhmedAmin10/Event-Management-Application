import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Eventy",
            style: GoogleFonts.pacifico(
              textStyle: const TextStyle(
                fontSize: 48.0,
                color: Color.fromRGBO(0, 27, 148, 1),
              ),
            ),
          ),
          const SizedBox(width: 0),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 26),
          //   child: const Icon(
          //     PhosphorIconsBold.person,
          //     size: 40,
          //     color: Color.fromRGBO(0, 27, 148, 1),
          //   ),
          // ),
        ],
      ),
    );
  }
}