import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../models/stock.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<BuyStockEvent>((event, emit) async {
      log('BUY STOCK EVENT');
      await getData();
      if (event.stock.price * event.count > myCoins) {
        emit(ShopErrorState());
      } else {
        await saveStock(event.stock.id, event.count);
        await saveMyCoins((event.stock.price + event.stock.grow) * event.count);
        emit(ShopSuccessState());
      }
    });

    on<SellStockEvent>((event, emit) async {
      log('SELL STOCK EVENT');
      await sellStock(
        event.stock.id,
        (event.stock.price + event.stock.grow) * event.count,
      );
      emit(ShopSuccessState());
    });

    on<GenerateEvent>((event, emit) async {
      log('GENERATE EVENT');
      emit(GeneratedEventState(stock: getRandomStock()));
    });
  }
}
