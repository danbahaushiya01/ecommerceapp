import 'package:ecommerceapp/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
//list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Moca',
        price: '230',
        imagepath: 'lib/images/shoe2.png',
        description:
            'The Forward-thinking design of his latest signature shoe'),
    Shoe(
        name: 'Air Jordan',
        price: '255',
        imagepath: 'lib/images/shoe1.png',
        description:
            'You\'ve got the hops and the speed-lace up in shoes that enhance'),
    Shoe(
        name: 'KD Treys',
        price: '240',
        imagepath: 'lib/images/shoe3.png',
        description:
            'A secure midfoot strap is suited for scoring binges and defensive '),
    Shoe(
        name: 'Kyrice 6',
        price: '238',
        imagepath: 'lib/images/shoe4.png',
        description:
            'Bouncing cushioning is paired with soft yet supportive foam for rest'),
  ];

//list of items in the user cart
  List<Shoe> usercart = [];

//get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart
  List<Shoe> getUserCart() {
    return usercart;
  }

//add item to the cart
  void addItemToCart(Shoe shoe) {
    usercart.add(shoe);
    notifyListeners();
  }

//remove item from the cart
  void removeItemFromCart(Shoe shoe) {
    usercart.remove(shoe);
    notifyListeners();
  }
}
