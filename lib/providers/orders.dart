import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/Cart.dart';
class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;

  OrderItem({this.id,this.amount,this.products,this.datetime});
}
class Orders with ChangeNotifier{
  List<OrderItem> _orders=[];
  List<OrderItem> get orders{
    return[..._orders];
  }
  void addOrder(List<CartItem> cartproducts, double total){
    _orders.insert(0, OrderItem(id: DateTime.now().toString(),amount: total,
                       datetime: DateTime.now(),products: cartproducts));
    notifyListeners();
  }

}
