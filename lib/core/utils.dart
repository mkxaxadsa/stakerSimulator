import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/shop/models/stock.dart';

bool onboarding = true;
double myCoins = 10000;
int stock1 = 0;
int stock2 = 0;
int stock3 = 0;
int stock4 = 0;
int stock5 = 0;
List<Stock> myStocks = [];

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  // await prefs.remove('myCoins');
  // await prefs.remove('stock1');
  // await prefs.remove('stock2');
  // await prefs.remove('stock3');
  // await prefs.remove('stock4');
  // await prefs.remove('stock5');
  onboarding = prefs.getBool('onboarding') ?? true;
  myCoins = prefs.getDouble('myCoins') ?? 10000;
  stock1 = prefs.getInt('stock1') ?? 0;
  stock2 = prefs.getInt('stock2') ?? 0;
  stock3 = prefs.getInt('stock3') ?? 0;
  stock4 = prefs.getInt('stock4') ?? 0;
  stock5 = prefs.getInt('stock5') ?? 0;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboarding', false);
}

Future<void> saveStock(int id, int count) async {
  final prefs = await SharedPreferences.getInstance();
  if (id == 1) prefs.setInt('stock1', stock1 + count);
  if (id == 2) prefs.setInt('stock2', stock2 + count);
  if (id == 3) prefs.setInt('stock3', stock3 + count);
  if (id == 4) prefs.setInt('stock4', stock4 + count);
  if (id == 5) prefs.setInt('stock5', stock5 + count);
  await getData();
  getMyStocks();
}

Future<void> saveMyCoins(double coins) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble('myCoins', myCoins - coins);
  myCoins = prefs.getDouble('myCoins') ?? 10000;
}

Future<void> sellStock(int id, double coins) async {
  final prefs = await SharedPreferences.getInstance();
  if (id == 1) prefs.setInt('stock1', 0);
  if (id == 2) prefs.setInt('stock2', 0);
  if (id == 3) prefs.setInt('stock3', 0);
  if (id == 4) prefs.setInt('stock4', 0);
  if (id == 5) prefs.setInt('stock5', 0);
  prefs.setDouble('myCoins', myCoins + coins);
  await getData();
  getMyStocks();
}

void getMyStocks() {
  myStocks = [];
  for (Stock stock in stocks) {
    if (stock1 != 0 && stock.id == 1) myStocks.add(stock);
    if (stock2 != 0 && stock.id == 2) myStocks.add(stock);
    if (stock3 != 0 && stock.id == 3) myStocks.add(stock);
    if (stock4 != 0 && stock.id == 4) myStocks.add(stock);
    if (stock5 != 0 && stock.id == 5) myStocks.add(stock);
  }
}

int getMyStockCount(Stock stock) {
  if (stock.id == 1) return stock1;
  if (stock.id == 2) return stock2;
  if (stock.id == 3) return stock3;
  if (stock.id == 4) return stock4;
  if (stock.id == 5) return stock5;
  return 0;
}

double getRandomPercent() {
  Random random = Random();
  double randomIndex = random.nextDouble() * random.nextDouble() * 6;
  double randomIndex2 = random.nextDouble() * -4;
  double data = randomIndex2 + randomIndex;
  double formattedValue = double.parse(data.toStringAsFixed(1));
  return formattedValue;
}

Stock getRandomStock() {
  Random random = Random();
  int randomIndex = random.nextInt(stocks.length);
  for (Stock stock in stocks) {
    if (stock == stocks[randomIndex]) {
      return Stock(
        id: stock.id,
        title: stock.title,
        asset: stock.asset,
        price: stock.price,
        grow: getRandomPercent(),
        positive: stock.positive,
        negative: stock.negative,
      );
    }
  }
  return stocks[randomIndex];
}

String getTotalStockPrice(Stock stock) {
  double total = (stock.price + stock.grow) * getMyStockCount(stock);
  String formattedNumber = total.toStringAsFixed(1);
  return formattedNumber.replaceAll('.0', '');
}

String getTotalStockPrice2(Stock stock, int count) {
  double total = (stock.price + stock.grow) * count;
  String formattedNumber = total.toStringAsFixed(1);
  return formattedNumber.replaceAll('.0', '');
}

String getTotalMoney() {
  String formattedNumber = myCoins.toStringAsFixed(1);
  return formattedNumber.replaceAll('.0', '');
}
