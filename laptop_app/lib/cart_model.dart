import 'package:flutter/material.dart';
import 'package:currency_formatter/currency_formatter.dart';

class CartModel extends ChangeNotifier {
  CurrencyFormat RupiahSettings = CurrencyFormat(
    symbol: 'Rp ',
    symbolSide: SymbolSide.left,
    thousandSeparator: '.',
    decimalSeparator: ',',
    symbolSeparator: ' ',
  );

  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Asus Tuf Gaming f15", "17999000", "assets/tuf.png", Colors.yellow],
    ["HP Victus 16", "22999000", "assets/Victus.jpeg", Colors.red],
    ["Macbook Pro M1", "16499000", "assets/macboook.jpeg", Colors.green],
    ["Lenovo Legion Pro 5i", "31879000", "assets/legion.jpeg", Colors.indigo],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  get cartLength => _cartItems.length;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);

    notifyListeners();
  }

  void removeAllItemFromCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return CurrencyFormatter.format(totalPrice, RupiahSettings).toString();
  }
}
