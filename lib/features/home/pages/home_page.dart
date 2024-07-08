import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/current_coins_card.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../shop/bloc/shop_bloc.dart';
import '../../shop/pages/shop_page.dart';
import '../../stock/bloc/stock_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/empty_data.dart';
import '../widgets/generate_card.dart';
import '../widgets/my_stock_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/your_stock_card.dart';
import 'news_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getMyStocks();
    context.read<StockBloc>().add(StartTimerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeShop) return const ShopPage();

                    if (state is HomeSettings) return const SettingsPage();

                    if (state is HomeNews) return const NewsPage();

                    return const _Home();
                  },
                ),
                const NavBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CurrentCoinsCard(),
                  const SizedBox(height: 7),
                  const GenerateCard(),
                  const SizedBox(height: 27),
                  YourStockCard(active: myStocks.isNotEmpty),
                ],
              ),
            ),
            if (myStocks.isEmpty)
              const EmptyData()
            else
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        children: [
                          ...List.generate(
                            myStocks.length,
                            (index) {
                              return MyStockCard(stock: myStocks[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 63 + MediaQuery.of(context).viewPadding.bottom,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
