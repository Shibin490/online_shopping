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
    print("================================");
    print("Product Name: $name");
    print("Product Price: $price,");
    print("Product Quantity: $quantity");
    print("Product ID: $id");
    print("================================");
  }
}
