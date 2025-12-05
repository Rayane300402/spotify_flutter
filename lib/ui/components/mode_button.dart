import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/configs/theme/palette.dart';

class ModeButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ModeButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Column(
      children: [
        SizedBox(
          height: 110, // gives room for the blob below the circle
          width: 90,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              // GREEN BLOB
              AnimatedPositioned(
                duration:  Duration(milliseconds: 250),
                curve: Curves.easeOut,
                bottom: isSelected ? 4 : -28, // slide it down when unselected
                child: AnimatedOpacity(
                  duration:  Duration(milliseconds: 200),
                  opacity: isSelected ? 1 : 0,
                  child:  _GreenBlob(),
                ),
              ),

              // CIRCLE
              GestureDetector(
                onTap: onTap,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff30303c).withValues(alpha: 0.7),
                        backgroundBlendMode: BlendMode.srcOver,
                        gradient: isSelected
                            ? RadialGradient(
                          radius: 0.95,
                          colors: [
                            primary.withValues(alpha:0.08),
                            primary,
                          ],
                        )
                            : null,
                      ),

                      child: Center(
                        child: SvgPicture.asset(
                          icon,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: isSelected ? Colors.white : Palette.grey,
          ),
        ),
      ],
    );
  }
}

class _GreenBlob extends StatelessWidget {
  const _GreenBlob();

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 50,
      height: 15,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.7),
            blurRadius: 24,
            spreadRadius: 6,
          ),
        ],
      ),
    );
  }
}
