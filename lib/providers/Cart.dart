import 'package:flutter/foundation.dart';
class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}
class Cart with ChangeNotifier{
  Map<String ,CartItem> _items={};
  Map<String, CartItem> get items{
    return{..._items};
  }
  int get itemcount{
    return _items.length;
  }

  double get totalamount{
    double total=0;
    _items.forEach((key, value) {
      total+=value.price * value.quantity;
    });
    return total;
  }
  void addItem(String productId,double price,String title){
    if(_items.containsKey(productId)){
       _items.update(productId, (existingitem) => CartItem(
         id: existingitem.id,price: existingitem.price,title: existingitem.title,
         quantity: existingitem.quantity+1
       ));
    }else{
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(),
          title: title,price: price,quantity: 1)
      );
    }
    notifyListeners();
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  void removeSingleItem(String productId){
    if(!_items.containsKey(productId)){
      return;
    }
    if(_items[productId].quantity>1){
      _items.update(productId, (existItem) => CartItem(
        id: existItem.id,
        title: existItem.title,
        price: existItem.price,
        quantity: existItem.quantity-1
      ));
    }else{
      _items.remove(productId);
    }
    notifyListeners();

  }
  void clear(){
    _items={};
    notifyListeners();
  }
}