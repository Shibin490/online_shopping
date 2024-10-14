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
    print(
        'Product ID: $id, Product: $name, Price: \$${price.toStringAsFixed(2)}, Quantity: $quantity, Discount: $discount%');
  }
}
