import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class BuyCard extends StatelessWidget {
  const BuyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 262,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Spacer(),
          Text(
            'Buy the\nstock',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  color: const Color(0xffD07397).withOpacity(0.5),
                  offset: const Offset(0, -8),
                  blurRadius: 15,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/shop.png',
            height: 75,
            color: AppColors.pink,
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }
}
