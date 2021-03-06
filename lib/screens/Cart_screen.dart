import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart'as ci;
class CartScreen extends StatelessWidget {
  static const routeName='/cart';
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(children: [
        Card(margin: EdgeInsets.all(15),child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("total",style: TextStyle(fontSize: 20),),
              SizedBox(width: 10,),
              Spacer(),
              Chip(label: Text("\$${cart.totalamount.toStringAsFixed(2)}",
                  style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color),),
              backgroundColor: Theme.of(context).primaryColor,),
              FlatButton(
                child: Text("Order Now",style: TextStyle(color: Theme.of(context).primaryColor),),
                onPressed: (){
                  Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(),
                      cart.totalamount);
                  cart.clear();
                },
                
              )
            ],
          ),
        ),),
        SizedBox(height:10),
        Expanded(child:ListView.builder(itemCount: cart.items.length,
          itemBuilder: (ctx,i)=>ci.CartItem(cart.items.values.toList()[i].id,
            cart.items.keys.toList()[i],
            cart.items.values.toList()[i].price,
            cart.items.values.toList()[i].quantity,
            cart.items.values.toList()[i].title,
          ),

        ))
      ],),
    );
  }
}
