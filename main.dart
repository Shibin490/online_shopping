// import 'dart:io';

// void main() {
//   ShoppingCart cart = ShoppingCart();

//   while (true) {
//     print("\n1. Add item");
//     print("2. add discounted Product");
//     print("3. View product details");
//     print("4. list items");
//     print("5. Exit");

//     stdout.write("Enter your choice: ");
//     String choice = stdin.readLineSync()!;

//     switch (choice) {
//       case '1':
//         var product = Product();

//         // Product name section
//         while (true) {
//           try {
//             stdout.write("Enter the name of the product: ");
//             String nameInput = stdin.readLineSync()!;
//             if (nameInput.isEmpty) {
//               print("Product name shouldn't be empty. Please try again.");
//               continue;
//             }

//             if (!RegExp('^[a-zA-Z]').hasMatch(nameInput)) {
//               print(
//                   "Product name should not start with a number. Please try again.");
//               continue;
//             }
//             print("Name added successfully.");
//             product.name = nameInput;
//             break;
//           } catch (e) {
//             print("Invalid input\nPlease try again");
//           }
//         }

//         // Product price section
//         while (true) {
//           stdout.write("Enter the price of the product: ");
//           String priceInput = stdin.readLineSync()!;

//           try {
//             double price = double.parse(priceInput);

//             if (price <= 0) {
//               print("Price must be a positive value. Please try again.");
//               continue;
//             }

//             print("Price added successfully.");
//             product.price = price;
//             break;
//           } catch (e) {
//             print("Invalid input. Please enter a valid number");
//           }
//         }

//         while (true) {
//           stdout.write("Enter the quantity of the product: ");
//           String quantityInput = stdin.readLineSync()!;

//           try {
//             int quantity = int.parse(quantityInput);

//             if (quantity <= 0) {
//               print("Quantity must be a positive value. Please try again.");
//               continue;
//             }

//             print("Quantity added successfully.");
//             product.quantity = quantity;
//             break;
//           } catch (e) {
//             print("Invalid input. Please enter a valid number");
//           }
//         }

//         while (true) {
//           stdout.write("Enter a unique positive ID for the product: ");
//           String idInput = stdin.readLineSync()!;

//           try {
//             int id = int.parse(idInput);
//             if (id <= 0) {
//               print("ID must be a positive number. Please try again.");
//               continue;
//             }

//             bool idExists = cart.items.any((product) => product.id == id);
//             if (idExists) {
//               print("ID already exists. Please enter a unique ID.");
//               continue;
//             }

//             product.id = id;
//             print("ID added successfully.");
//             break;
//           } catch (e) {
//             print("Invalid input. Please enter a valid number.");
//           }
//         }

//         cart.addItem(product);
//         print("Product added successfully.");
//         break;
//       case '2':
//         var discountedItem = DiscountedProduct();
//         addItemDetails(discountedItem, cart);

//         // Add discount section
//         while (true) {
//           stdout.write("Enter the discount percentage for the item: ");
//           String discountInput = stdin.readLineSync()!;

//           try {
//             double discount = double.parse(discountInput);
//             if (discount < 0 || discount > 100) {
//               print("Discount must be between 0 and 100. Please try again.");
//               continue;
//             }

//             discountedItem.discount = discount;
//             print("Discount added successfully.");
//             break;
//           } catch (e) {
//             print("Invalid input. Please enter a valid number.");
//           }
//         }

//         cart.addItem(discountedItem);
//         print("Discounted item added successfully.");
//         break;
//       case '3':
//         stdout.write("Enter the product ID you want to view: ");
//         String idInput = stdin.readLineSync()!;

//         try {
//           int id = int.parse(idInput);
//           var product = cart.getProductById(id);
//           if (product != null) {
//             product.printDetails();
//           } else {
//             print("Product not found. Please try with a correct ID.");
//           }
//         } catch (e) {
//           print("Invalid ID input. Please enter a valid number.");
//         }
//         break;

//       case '4':
//         cart.listItems();
//         break;

//       case '5':
//         print("Exiting...");
//         return;

//       default:
//         print("Invalid choice. Please enter a valid option.");
//         break;
//     }
//   }
// }

// void addItemDetails(DiscountedProduct discountedItem, ShoppingCart cart) {}

// class DiscountedProduct extends Product {
//   double discount = 0.0;

//   double getFinalPrice() {
//     return price - (price * (discount / 100));
//   }

//   @override
//   void printDetails() {
//     super.printDetails();
//     print("Discount: $discount%");
//     print("Original Price: $price");
//     print("Discounted Price: ${getFinalPrice()}");
//   }
// }

// class Product {
//   String name = "";
//   double price = 0.0;
//   int quantity = 0;
//   int id = 0;

//   void printDetails() {
//     print("Product Name: $name");
//     print("Product Quantity: $quantity");
//     print("Product ID: $id");
//     print("discount:$DiscountedProduct%");
//     print("original: $price");
//   }
// }

// class ShoppingCart {
//   List<Product> _items = [];

//   List<Product> get items => _items;

//   void addItem(Product product) {
//     _items.add(product);
//   }

//   void removeItem(int id) {
//     _items.removeWhere((product) => product.id == id);
//   }

//   Product? getProductById(int id) {
//     try {
//       return _items.firstWhere((product) => product.id == id);
//     } catch (e) {
//       return null;
//     }
//   }

//   void listItems() {
//     if (_items.isEmpty) {
//       print("No products available in the cart.");
//     } else {
//       print("List of Products in the Cart:");
//       for (var product in _items) {
//         product.printDetails();
//         print("================================");
//       }
//     }
//   }
// }

// ====================================================================================
import 'dart:io';
import 'discounted product.dart';
import 'product.dart';
import 'shoping cart.dart';

void main() async {
  ShoppingCart cart = ShoppingCart();
  bool isRunning = true;

  while (isRunning) {
    print("-----Shopping Cart Menu -----");
    print("1. Add Product");
    print("2. Add Discounted Product");
    print("3. Remove Product");
    print("4. View Cart");
    print("5. Checkout");
    print("6. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await addProduct(cart);
        break;
      case '2':
        await addDiscountedProduct(cart);
        break;
      case '3':
        removeProduct(cart);
        break;
      case '4':
        viewCart(cart);
        break;
      case '5':
        checkout(cart);
        break;
      case '6':
        isRunning = false;
        print("Exiting...");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

Future<void> addProduct(ShoppingCart cart) async {
  print("\n--- Add Product ---");

  String name;
  double price;
  int quantity;
  int id;

  // Product name section
  while (true) {
    try {
      stdout.write("Enter the name of the product: ");
      String? inputName = stdin.readLineSync();
      if (inputName == null || inputName.isEmpty) {
        print("Product name shouldn't be empty. Please try again.");
        continue;
      }

      if (!RegExp('^[a-zA-Z]').hasMatch(inputName)) {
        print(
            "Product name should start with an alphabet and cannot be empty. Please try again.");
        continue;
      }
      name = inputName;
      print("Name added successfully.");
      break;
    } catch (e) {
      print("Invalid input. Please try again.");
    }
  }

  // Product price section
  while (true) {
    try {
      stdout.write("Enter product price: ");
      double? inputPrice = double.tryParse(stdin.readLineSync()!);
      if (inputPrice == null) {
        print(
            "Product price should be a number and cannot be empty. Please try again.");
        continue;
      }

      if (inputPrice <= 0) {
        print("Product price should be a positive number. Please try again.");
        continue;
      }
      price = inputPrice;
      print("Price added successfully.");
      break;
    } catch (e) {
      print("Invalid input. Please try again.");
    }
  }

  // Product quantity section
  while (true) {
    try {
      stdout.write("Enter product quantity: ");
      int? inputQuantity = int.tryParse(stdin.readLineSync()!);
      if (inputQuantity == null || inputQuantity <= 0) {
        print(
            "Product quantity should be a positive integer and cannot be empty. Please try again.");
        continue;
      }
      quantity = inputQuantity;
      print("Quantity added successfully.");
      break;
    } catch (e) {
      print("Invalid input. Please try again.");
    }
  }

  // Unique ID section
  while (true) {
    stdout.write("Enter a unique positive ID for the product: ");
    String idInput = stdin.readLineSync()!;

    try {
      id = int.parse(idInput);
      if (id <= 0) {
        print("ID must be a positive number. Please try again.");
        continue;
      }

      bool idExists = cart.items.any((product) => product.id == id);
      if (idExists) {
        print("ID already exists. Please enter a unique ID.");
        continue;
      }

      print("ID added successfully.");
      break;
    } catch (e) {
      print("Invalid input. Please enter a valid number.");
    }
  }

  Product product = Product(name, price, quantity, id);
  cart.addItem(product);
}

Future<void> addDiscountedProduct(ShoppingCart cart) async {
  print("\n--- Add Discounted Product ---");
  stdout.write("Enter product name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter product price: ");
  double? price = double.tryParse(stdin.readLineSync()!);

  stdout.write("Enter product quantity: ");
  int? quantity = int.tryParse(stdin.readLineSync()!);

  stdout.write("Enter discount percentage: ");
  double? discount = double.tryParse(stdin.readLineSync()!);

  if (name != null && price != null && quantity != null && discount != null) {
    DiscountedProduct discountedProduct =
        DiscountedProduct(name, price, quantity, discount);
    cart.addItem(discountedProduct);
  } else {
    print("Invalid input. Please try again.");
  }
}

void removeProduct(ShoppingCart cart) {
  print("\n--- Remove Product ---");
  stdout.write("Enter product name to remove: ");
  String? name = stdin.readLineSync();

  if (name != null) {
    Product? productToRemove;
    for (var product in cart.items) {
      if (product.name == name) {
        productToRemove = product;
        break;
      }
    }

    if (productToRemove != null) {
      cart.removeItem(productToRemove);
    } else {
      print("Product not found in the cart.");
    }
  } else {
    print("Invalid input. Please try again.");
  }
}

void viewCart(ShoppingCart cart) {
  print("\n--- View Cart ---");
  cart.listItems();
}

void checkout(ShoppingCart cart) {
  print("\n--- Checkout ---");
  try {
    double totalPrice = cart.getTotalPrice();
    print("Total Price: \$${totalPrice.toStringAsFixed(2)}");
  } catch (e) {
    print(e);
  }
}

// class Product {
//   // Private fields for encapsulation
//   String name;
//   double price;
//   int quantity;
//   int id;

//   Product(this.name, this.price, this.quantity, this.id);

//   String get name => name;
//   double get price => price;
//   int get id => id;
//   int get quantity => quantity;

//   double getFinalPrice() {
//     return price * quantity;
//   }

//   void printDetails() {
//     print(
//         'Product ID: $id, Product: $name, Price: \$${price.toStringAsFixed(2)}, Quantity: $quantity');
//   }
// }

// class ShoppingCart {
//   List<Product> _items = [];

//   List<Product> get items => _items;

//   void addItem(Product product) {
//     _items.add(product);
//     print('${product.name} added to the cart.');
//   }

//   void removeItem(Product product) {
//     if (_items.contains(product)) {
//       _items.remove(product);
//       print('${product.name} removed from the cart.');
//     } else {
//       print('${product.name} is not in the cart.');
//     }
//   }

//   double getTotalPrice() {
//     if (_items.isEmpty) {
//       throw Exception("Your cart is empty.");
//     }

//     double total = 0.0;
//     for (var item in _items) {
//       total += item.getFinalPrice();
//     }
//     return total;
//   }

//   void listItems() {
//     if (_items.isEmpty) {
//       print("Your cart is empty.");
//     } else {
//       for (var product in _items) {
//         product.printDetails();
//       }
//     }
//   }
// }

// class DiscountedProduct extends Product {
//   double discount;

//   DiscountedProduct(String name, double price, int quantity, this.discount)
//       : super(name, price, quantity, DateTime.now().millisecondsSinceEpoch);

//   @override
//   double getFinalPrice() {
//     return (price * (1 - discount / 100)) * quantity;
//   }

//   @override
//   void printDetails() {
//     print(
//         'Product ID: $id, Product: $name, Price: \$${price.toStringAsFixed(2)}, Quantity: $quantity, Discount: $discount%');
//   }
// }
