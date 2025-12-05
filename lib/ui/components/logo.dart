import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/configs/assets/vectors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SvgPicture.asset(Vectors.logo),
    );
  }
}
