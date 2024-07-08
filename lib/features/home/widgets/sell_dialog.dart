import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/money_icon.dart';
import '../../shop/bloc/shop_bloc.dart';
import '../../shop/models/stock.dart';
import '../../stock/bloc/stock_bloc.dart';

class SellDialog extends StatelessWidget {
  const SellDialog({super.key, required this.stock});

  final Stock stock;

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
              const SizedBox(height: 7),
              Row(
                children: [
                  const SizedBox(width: 14),
                  const Text(
                    'Sell Finance stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xffB104EB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CupertinoButton(
                      onPressed: () {
                        context.pop();
                      },
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        'assets/close.png',
                        height: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                ],
              ),
              const Spacer(),
              _DataCard(count: getMyStockCount(stock), stock: stock),
              const SizedBox(height: 13),
              _DataCard(stock: stock),
              const Spacer(),
              _Button(
                onPressed: () {
                  context.read<ShopBloc>().add(
                        SellStockEvent(
                          stock: stock,
                          count: getMyStockCount(stock),
                        ),
                      );
                  context.pop();
                },
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard({
    this.count = 1,
    required this.stock,
  });

  final Stock stock;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: const Color(0xff5D1574),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count > 1 ? 'You have' : 'Sell price',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 50,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/chemodan.png',
                      height: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      count > 1 ? 'x $count' : 'x 1',
                      style: const TextStyle(
                        color: AppColors.pink,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  return Text(
                    getTotalStockPrice2(stock, count),
                    style: const TextStyle(
                      color: AppColors.pink,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                  );
                },
              ),
              const MoneyIcon(percent: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xff7F04A8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Image.asset(
                  'assets/sell2.png',
                  height: 8,
                ),
              ),
            ),
            const SizedBox(width: 2),
            const Text(
              'Sell',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
