import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stake/features/shop/widgets/success_dialog.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/current_coins_card.dart';
import '../../stock/bloc/stock_bloc.dart';
import '../bloc/shop_bloc.dart';
import '../models/stock.dart';
import '../widgets/buy_button.dart';
import '../widgets/error_dialog.dart';
import '../widgets/quantity_field.dart';
import '../widgets/stock_card.dart';
import '../widgets/total_price_card.dart';

class StockPage extends StatefulWidget {
  const StockPage({
    super.key,
    required this.stock,
    required this.sell,
  });

  final Stock stock;
  final bool sell;

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final controller = TextEditingController();

  bool active = true;

  String getTotalPrice() {
    try {
      double price = widget.stock.price + widget.stock.grow;
      double total = int.parse(controller.text) * price;
      String formattedNumber = total.toStringAsFixed(1);
      return formattedNumber.replaceAll('.0', '');
    } catch (e) {
      return widget.stock.price.toString();
    }
  }

  void checkActive() {
    setState(() {
      if (controller.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    log(widget.sell.toString());
    controller.text = '1';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const CurrentCoinsCard(),
                      const _Text('Type', 16),
                      const SizedBox(height: 8),
                      StockCard(
                        stock: widget.stock,
                        active: false,
                      ),
                      const SizedBox(height: 8),
                      const _Text('Quantity of purchase', 16),
                      const SizedBox(height: 8),
                      QuantityField(
                        controller: controller,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 8),
                      const _Text('Description', 20),
                      const SizedBox(height: 19),
                      const Text(
                        'Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 42,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        color: Colors.white,
                      ),
                      Text(
                        widget.stock.grow < 0 ? 'Negative' : 'Positive',
                        style: TextStyle(
                          color: widget.stock.grow < 0
                              ? const Color(0xffC92F2F)
                              : const Color(0xff37E83E),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.stock.grow < 0
                            ? widget.stock.negative
                            : widget.stock.positive,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 21),
                      const _Text('Total price:', 20),
                      const SizedBox(height: 8),
                      TotalPriceCard(total: getTotalPrice()),
                      const Spacer(),
                      BlocListener<ShopBloc, ShopState>(
                        listener: (context, state) {
                          if (state is ShopSuccessState) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SuccessDialog(
                                  stock: widget.stock,
                                  count: int.parse(controller.text),
                                );
                              },
                            );
                          }

                          if (state is ShopErrorState) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const ErrorDialog();
                              },
                            );
                          }
                        },
                        child: SellButton(
                          sell: widget.sell,
                          active: active,
                          onPressed: () {
                            context.read<ShopBloc>().add(BuyStockEvent(
                                  stock: widget.stock,
                                  count: int.parse(controller.text),
                                ));
                          },
                        ),
                      ),
                      const SizedBox(height: 41),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(
    this.title,
    this.fontSize,
  );

  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
