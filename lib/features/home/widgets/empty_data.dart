import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'Empty',
            style: TextStyle(
              color: AppColors.pink,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Buy the first shares\nin the store',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xffFFFFFF).withOpacity(0.5),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Image.asset(
            'assets/shop.png',
            height: 35,
            color: const Color(0xffFFFFFF).withOpacity(0.7),
          ),
          const Spacer(),
          const SizedBox(height: 63),
        ],
      ),
    );
  }
}
