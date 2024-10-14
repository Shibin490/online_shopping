class Product {
  String name;
  double price;
  int quantity;
  int id;

  Product(this.name, this.price, this.quantity, this.id);

  String get Name => name;
  double get Price => price;
  int get Id => id;
  int get Quantity => quantity;

  double getFinalPrice() {
    return price * quantity;
  }

  void printDetails() {
    print(
        'Product ID: $id, Product: $name, Price: \$${price.toStringAsFixed(2)}, Quantity: $quantity');
  }
}
