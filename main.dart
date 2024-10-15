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
    stdout.write("Enter a number for ID : ");
    String idInput = stdin.readLineSync()!;

    try {
      id = int.parse(idInput);
      if (id <= 0) {
        print("ID must be a positive number. Please try again.");
        continue;
      }

      bool idExists = cart.items.any((product) => product.id == id);
      if (idExists) {
        print("ID (Number) already exists. Please enter a unique ID.");
        continue;
      }

      print("ID added successfully.");
      break;
    } catch (e) {
      print("Invalid input. id cannot be empty and cannot be alphabet.");
      print("Please enter a valid number for ID.");
    }
  }

  Product product = Product(name, price, quantity, id);
  cart.addItem(product);
}

// =======================================discount product==========================================================

Future<void> addDiscountedProduct(ShoppingCart cart) async {
  print("\n--- Add Discounted Product ---");
  String name;
  while (true) {
    try {
      stdout.write("Enter product name: ");
      String? inputName = stdin.readLineSync();

      if (inputName == null || inputName.isEmpty) {
        throw Exception("Product name cannot be empty.");
      }

      if (!RegExp(r'^[a-zA-Z]').hasMatch(inputName)) {
        throw Exception("Product name must start with a letter.");
      }

      name = inputName;
      print("Name added successfully.");
      break;
    } catch (e) {
      print("Please try again.");
    }
  }
  double price;

  while (true) {
    try {
      stdout.write("Enter product price: ");
      String inputPrice = stdin.readLineSync()!;

      if (inputPrice.isEmpty) {
        throw Exception("Product price cannot be empty.");
      }

      double parsedPrice = double.parse(inputPrice);

      if (parsedPrice <= 0) {
        throw Exception("Product price must be a positive number.");
      }

      price = parsedPrice;
      print("Price added successfully.");
      break;
    } catch (e) {
      print("invalid input.Please try again.");
    }
  }

  int quantity;
  while (true) {
    try {
      stdout.write("Enter product quantity: ");
      String? inputQuantity = stdin.readLineSync();

      if (inputQuantity == null) {
        throw Exception("Product quantity cannot be empty.");
      }

      int parsedQuantity = int.parse(inputQuantity);
      if (parsedQuantity <= 0) {
        throw Exception("Product quantity must be a positive number.");
      }

      quantity = parsedQuantity;
      print("Quantity added successfully.");
      break;
    } catch (e) {
      print("invalid input.Please try again.");
    }
  }
  double discount;
  while (true) {
    try {
      stdout.write("Enter discount percentage: ");
      String? inputDiscount = stdin.readLineSync();

      if (inputDiscount == null || inputDiscount.isEmpty) {
        throw Exception("Discount percentage cannot be empty.");
      }

      double parsedDiscount = double.parse(inputDiscount);
      if (parsedDiscount < 0 || parsedDiscount > 100) {
        throw Exception("Discount percentage must be between 0 and 100.");
      }

      discount = parsedDiscount;
      print("Discount added successfully.");
      break;
    } catch (e) {
      print("Please enter a valid number for percentage.");
    }
  }
  while (true) {
    try {
      stdout.write("Enter a number  for ID : ");
      String? inputID = stdin.readLineSync();

      if (inputID == null || inputID.isEmpty) {
        throw Exception("Product ID cannot be empty.");
      }

      int parsedID = int.parse(inputID);
      if (parsedID <= 0) {
        throw Exception("Product ID must be a positive number.");
      }

      bool idExists = cart.items.any((product) => product.id == parsedID);
      if (idExists) {
        print("ID (Nnumber) already exists. Please enter a unique ID.");
      }

      print("ID added successfully.");
      break;
    } catch (e) {
      print("Please enter a valid number for  ID.");
    }
  }

  // ignore: unnecessary_null_comparison
  if (name != null && price != null && quantity != null && discount != null) {
    DiscountedProduct discountedProduct =
        DiscountedProduct(name, price, quantity, discount);
    cart.addItem(discountedProduct);
    print("${name} added successfully");
  } else {
    print("Invalid input. Please try again.");
  }
}

void removeProduct(ShoppingCart cart) {
  print("\n--- Remove Product ---");

  String name;
  int id;

  while (true) {
    try {
      stdout.write("Enter product name to remove: ");
      String? inputName = stdin.readLineSync();

      if (inputName == null || inputName.isEmpty) {
        throw Exception("Product name cannot be empty.");
      }

      name = inputName;
      break;
    } catch (e) {
      print("Error: ${e.toString()}");
      print("Please try again.");
    }
  }

  while (true) {
    try {
      stdout.write("Enter product ID to remove: ");
      String? inputId = stdin.readLineSync();

      if (inputId == null || inputId.isEmpty) {
        throw Exception("Product ID cannot be empty. Please enter the ID.");
      }

      int parsedId = int.parse(inputId);
      if (parsedId <= 0) {
        throw Exception("Product ID must be a positive number.");
      }

      id = parsedId; // Assign the manually entered ID
      break;
    } catch (e) {
      print(
          "Invalid input. Product ID must be a positive number and cannot be alphabet.");
      print("Please enter the product ID.");
    }
  }

  Product? productToRemove;
  for (var product in cart.items) {
    if (product.name == name && product.id == id) {
      productToRemove = product;
      break;
    }
  }

  if (productToRemove != null) {
    cart.removeItem(productToRemove);
  } else {
    print("Product not found in the cart.");
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
// 