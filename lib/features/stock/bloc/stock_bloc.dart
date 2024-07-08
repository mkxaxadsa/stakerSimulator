import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../shop/models/stock.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<StartTimerEvent>((event, emit) {
      log('START TIMER EVENT');
      Timer.periodic(const Duration(seconds: 2), (t) {
        add(ChangePriceEvent());
      });
    });

    on<ChangePriceEvent>((event, emit) {
      log('CHANGE PRICE EVENT');
      for (Stock stock in stocks) {
        stock.grow = getRandomPercent();
      }
      emit(StockPriceChanged(stocks: stocks));
    });
  }
}
