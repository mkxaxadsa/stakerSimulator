part of 'shop_bloc.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopErrorState extends ShopState {}

class GeneratedEventState extends ShopState {
  final Stock stock;
  GeneratedEventState({required this.stock});
}
