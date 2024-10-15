import 'product.dart';

class ShoppingCart {
  List<Product> items = [];

  List<Product> get item => items;

  void addItem(Product product) {
    items.add(product);
    print('${product.name} added to the cart.');
  }

  void removeItem(Product product) {
    if (items.contains(product)) {
      items.remove(product);
      print('${product.name} removed from the cart.');
    } else {
      print('${product.name} is not in the cart.');
    }
  }

  double getTotalPrice() {
    if (items.isEmpty) {
      throw Exception("Your cart is empty.");
    }

    double total = 0.0;
    for (var item in items) {
      total += item.getFinalPrice();
    }
    return total;
  }

  void listItems() {
    if (items.isEmpty) {
      print("Your cart is empty.");
    } else {
      for (var product in items) {
        product.printDetails();
      }
    }
  }
}
