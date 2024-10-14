import 'product.dart';

class ShoppingCart {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
    print('${product.name} added to the cart.');
  }

  void removeItem(Product product) {
    if (_items.contains(product)) {
      _items.remove(product);
      print('${product.name} removed from the cart.');
    } else {
      print('${product.name} is not in the cart.');
    }
  }

  double getTotalPrice() {
    if (_items.isEmpty) {
      throw Exception("Your cart is empty.");
    }

    double total = 0.0;
    for (var item in _items) {
      total += item.getFinalPrice();
    }
    return total;
  }

  void listItems() {
    if (_items.isEmpty) {
      print("Your cart is empty.");
    } else {
      for (var product in _items) {
        product.printDetails();
      }
    }
  }
}
