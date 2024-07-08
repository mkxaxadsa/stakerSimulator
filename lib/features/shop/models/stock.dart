class Stock {
  final int id;
  final String title;
  final String asset;
  double price;
  double grow;
  final String positive;
  final String negative;

  Stock({
    required this.id,
    required this.title,
    required this.asset,
    required this.price,
    required this.grow,
    required this.positive,
    required this.negative,
  });
}

List<Stock> stocks = [
  Stock(
    id: 1,
    title: 'Finance',
    asset: 'stock1',
    price: 180,
    grow: -20,
    positive:
        'A new law has come out to ban the circulation of funds under 100 million. Due to this, many investors started to take an interest in cryptocurrency',
    negative:
        'There was a market crash, many currencies failed to materialize and their existence ceased, investors are not happy about this, will have to limit their choice for investment',
  ),
  Stock(
    id: 2,
    title: 'Technology',
    asset: 'stock2',
    price: 190,
    grow: 0,
    positive:
        'A new technology came out, the demand for gadgets increased dramatically, this interested investors',
    negative:
        'The earth\'s atmosphere has changed, cell phones no longer work, scientists are looking for solutions, but it\'s not worth investing in just yet',
  ),
  Stock(
    id: 3,
    title: 'Medicine',
    asset: 'stock3',
    price: 170,
    grow: 0,
    positive:
        'Invented a new drug for teeth, now there is no point in dentistry, but there is a new direction in medicine',
    negative:
        'A large number of legal medicines have been removed because of their harmfulness, now it has become even riskier to invest in medicine',
  ),
  Stock(
    id: 4,
    title: 'Energy',
    asset: 'stock4',
    price: 185,
    grow: 0,
    positive:
        'They discovered a new way to get infinite energy, now there\'s no point in paying for it, but not everyone can use it.',
    negative:
        'Invented a new energy source, but it\'s very costly, unlikely to be used, shares start to fall',
  ),
  Stock(
    id: 5,
    title: 'Space',
    asset: 'stock5',
    price: 200,
    grow: 0,
    positive:
        'Found a new material for missiles, now they last much longer, also discovered a new material that will strengthen the economy of the world',
    negative:
        'The economics of rocket science have collapsed, slowly but surely running out of material to create a defense against high temperatures',
  ),
];
