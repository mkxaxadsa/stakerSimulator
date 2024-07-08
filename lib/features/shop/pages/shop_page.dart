import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/current_coins_card.dart';
import '../../stock/bloc/stock_bloc.dart';
import '../widgets/buy_card.dart';
import '../widgets/stock_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CurrentCoinsCard(),
          const SizedBox(height: 13),
          const BuyCard(),
          const SizedBox(height: 34),
          BlocBuilder<StockBloc, StockState>(
            builder: (context, state) {
              if (state is StockPriceChanged) {
                return Column(
                  children: [
                    ...List.generate(
                      state.stocks.length,
                      (index) {
                        return StockCard(stock: state.stocks[index]);
                      },
                    ),
                  ],
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
