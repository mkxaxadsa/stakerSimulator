part of 'stock_bloc.dart';

abstract class StockEvent {}

class StartTimerEvent extends StockEvent {}

class ChangePriceEvent extends StockEvent {}
