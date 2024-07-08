import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/money_icon.dart';
import '../../shop/models/stock.dart';
import '../../stock/bloc/stock_bloc.dart';
import 'sell_dialog.dart';

class Settings extends StatelessWidget {
  final String config;

  const Settings({Key? key, required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(config)),
      ),
    );
  }
}

class MyStockCard extends StatelessWidget {
  const MyStockCard({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffBF00FF).withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 92,
            child: Column(
              children: [
                const SizedBox(height: 12),
                Image.asset(
                  'assets/${stock.asset}.png',
                  height: 70,
                ),
                Text(
                  stock.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          BlocBuilder<StockBloc, StockState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: (90 * 30) / 100),
                      Text(
                        '${stock.price + stock.grow}',
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
                  const Text(
                    'You have',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: (90 * 30) / 100),
                      Text(
                        getTotalStockPrice(stock),
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
                  Row(
                    children: [
                      Image.asset(
                        'assets/chemodan.png',
                        height: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        'x ${getMyStockCount(stock)}',
                        style: const TextStyle(
                          color: AppColors.pink,
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                ],
              );
            },
          ),
          const Spacer(),
          BlocBuilder<StockBloc, StockState>(
            builder: (context, state) {
              return SizedBox(
                width: 92,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 45,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            stock.grow < 0
                                ? 'assets/grow2.svg'
                                : 'assets/grow1.svg',
                          ),
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
                    const SizedBox(height: 10),
                    _Button(
                      sell: false,
                      onPressed: () {
                        context.push('/stock', extra: {
                          "stock": stock,
                          "sell": false,
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    _Button(
                      sell: true,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SellDialog(stock: stock);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.sell,
    required this.onPressed,
  });

  final bool sell;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 65,
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
                  sell ? 'assets/sell2.png' : 'assets/sell1.png',
                  height: 8,
                ),
              ),
            ),
            const SizedBox(width: 2),
            Text(
              sell ? 'Sell' : 'Buy',
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
