import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_stake/core/utils.dart';

import '../../features/shop/models/stock.dart';
import '../config/app_colors.dart';
import 'money_icon.dart';

class StockPrice extends StatelessWidget {
  const StockPrice({
    super.key,
    required this.stock,
    this.count = 1,
  });

  final Stock stock;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 45,
          child: Row(
            children: [
              SvgPicture.asset(
                stock.grow < 0 ? 'assets/grow2.svg' : 'assets/grow1.svg',
              ),
              // const SizedBox(width: 4),
              const Spacer(),
              Text(
                '${stock.grow}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF',
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Price',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF',
          ),
        ),
        Row(
          children: [
            Text(
              getTotalStockPrice2(stock, count),
              style: const TextStyle(
                color: AppColors.pink,
                fontSize: 9,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF',
              ),
            ),
            const MoneyIcon(percent: 30),
          ],
        ),
      ],
    );
  }
}
