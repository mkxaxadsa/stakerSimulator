import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/stock_price.dart';
import '../models/stock.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.stock,
    required this.count,
  });

  final Stock stock;
  final int count;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: const Color(0xff1C1027),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                'Congratulations !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'You have purchased one share',
                style: TextStyle(
                  color: const Color(0xffFFFFFF).withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(width: 36),
                  Image.asset(
                    'assets/${stock.asset}.png',
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/chemodan.png',
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'x $count',
                    style: const TextStyle(
                      color: AppColors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const _Arrow(),
                  const Spacer(),
                  StockPrice(
                    stock: stock,
                    count: count,
                  ),
                  const SizedBox(width: 36),
                ],
              ),
              const Spacer(),
              const _Button(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 2,
              width: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(1),
                  bottomRight: Radius.circular(1),
                ),
              ),
            ),
          ),
          const Positioned(
            right: -6.5,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(
        horizontal: 38,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff7F04A8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.pop();
          // context.pop();
        },
        padding: EdgeInsets.zero,
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
    );
  }
}
