import 'package:flutter/material.dart';
import 'package:my_stake/core/config/app_colors.dart';

class TotalPriceCard extends StatelessWidget {
  const TotalPriceCard({super.key, required this.total});

  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          total,
          style: const TextStyle(
            color: AppColors.pink,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
