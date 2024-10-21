import 'package:ecommerceapp/components/shoe_tile.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopePage extends StatefulWidget {
  const ShopePage({super.key});


   @override
  State<ShopePage> createState() => _ShopePageState();


}

class _ShopePageState extends State<ShopePage> {

 //  add shoe to cart
  void addShoeToCart(Shoe shoe){
      Provider.of<Cart>(context,listen: false).addItemToCart(shoe);

      //alert the user, shoe successfullyy added
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Successfully added'),
        content: Text('Check your cart'),
      ),);
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search box
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                //message
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Everyone flies ..some fly longer than others',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                //hot picks
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                //List of Shoes for sale

                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //create a shoe
                      // Shoe shoe = Shoe(
                      //     name: 'Air Jordan',
                      //     price: '240',
                      //     imagepath: 'lib/images/shoe1.png',
                      //     description: 'Cool shoe');
                      //get a shoe from shop list

                      Shoe shoe = value.getShoeList()[index];

                      return ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Divider(color: Colors.white,),
                )
              ],
            ));
  }
}
