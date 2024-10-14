class Product {
  String _name;
  double _price;
  int _quantity;
  int _id;

  Product(this._name, this._price, this._quantity, this._id);

  String get name => _name;
  double get price => _price;
  int get id => _id;
  int get quantity => _quantity;

  double getFinalPrice() {
    return _price * _quantity;
  }

  void printDetails() {
    print(
        'Product ID: $_id, Product: $_name, Price: \$${_price.toStringAsFixed(2)}, Quantity: $_quantity');
  }
}
