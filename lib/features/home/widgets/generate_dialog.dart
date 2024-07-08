import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_stake/core/config/app_colors.dart';
import 'package:my_stake/core/utils.dart';
import 'package:my_stake/core/widgets/money_icon.dart';
import 'package:my_stake/core/widgets/stock_price.dart';
import 'package:my_stake/features/shop/bloc/shop_bloc.dart';
import 'package:my_stake/features/shop/widgets/success_dialog.dart';

import '../../shop/models/stock.dart';

class GenerateDialog extends StatelessWidget {
  const GenerateDialog({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.only(
          bottom: 80,
          left: 40,
          right: 40,
        ),
        backgroundColor: const Color(0xff1C1027),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Container(
          height: 392,
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
              const SizedBox(height: 20),
              Container(
                height: 80,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffBF00FF).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/${stock.asset}.png',
                      height: 60,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      stock.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    StockPrice(stock: stock),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  SizedBox(width: 16),
                  Text(
                    'You have',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/chemodan.png',
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'x ${getMyStockCount(stock)}',
                    style: const TextStyle(
                      color: AppColors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const _Arrow(),
                  const Spacer(),
                  Text(
                    getTotalStockPrice(stock),
                    style: const TextStyle(
                      color: AppColors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const MoneyIcon(percent: 30),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      const Text(
                        'Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 42,
                        color: Colors.white,
                      ),
                      Text(
                        stock.grow > 0 ? 'Positive' : 'Negative',
                        style: TextStyle(
                          color: stock.grow > 0
                              ? const Color(0xff37E83E)
                              : const Color(0xffC92F2F),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Text(
                  stock.grow > 0 ? stock.positive : stock.negative,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (getMyStockCount(stock) == 0)
                    _Button(
                      title: 'Buy',
                      width: 200,
                      asset: 'sell1',
                      onPressed: () {
                        context.read<ShopBloc>().add(
                              BuyStockEvent(stock: stock, count: 1),
                            );
                        context.pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessDialog(stock: stock, count: 1);
                          },
                        );
                      },
                    )
                  else ...[
                    _Button(
                      title: 'Sell',
                      width: 90,
                      asset: 'sell2',
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
                    const SizedBox(width: 56),
                    _Button(
                      title: 'Buy',
                      width: 90,
                      asset: 'sell1',
                      onPressed: () {
                        context
                            .read<ShopBloc>()
                            .add(BuyStockEvent(stock: stock, count: 1));
                        context.pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessDialog(
                              stock: stock,
                              count: getMyStockCount(stock),
                            );
                          },
                        );
                      },
                    ),
                  ]
                ],
              ),
              const SizedBox(height: 18),
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
              width: 126,
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
  const _Button({
    required this.title,
    required this.width,
    required this.asset,
    required this.onPressed,
  });

  final String title;
  final double width;
  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
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
                  'assets/$asset.png',
                  height: 8,
                ),
              ),
            ),
            const SizedBox(width: 2),
            Text(
              title,
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
    );
  }
}
