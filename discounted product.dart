import 'product.dart';

class DiscountedProduct extends Product {
  double discount;

  DiscountedProduct(String name, double price, int quantity, this.discount)
      : super(name, price, quantity, DateTime.now().millisecondsSinceEpoch);

  @override
  double getFinalPrice() {
    return (price * (1 - discount / 100)) * quantity;
  }

  @override
  void printDetails() {
    print("________discounted product_________");
    print(" Product Name: $name");
    print(" Product Price: $price");
    print(" Product Quantity: $quantity");
    print(" Product ID: $id");
    print(" Product discount : $discount%");
    print("___________________________________");
  }
}
