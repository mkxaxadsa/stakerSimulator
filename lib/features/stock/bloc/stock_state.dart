part of 'stock_bloc.dart';

abstract class StockState {}

class StockInitial extends StockState {}

class StockPriceChanged extends StockState {
  final List<Stock> stocks;
  StockPriceChanged({required this.stocks});
}
