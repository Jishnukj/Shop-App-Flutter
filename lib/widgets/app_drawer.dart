import 'package:flutter/material.dart';
import 'package:shop_app/screens/OrdersScreen.dart';
import 'package:shop_app/screens/user_products.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(leading: Icon(Icons.shop),
          title: Text('shop'),
              onTap: (){
                  Navigator.of(context).pushReplacementNamed('/');
              },
          ),
          Divider(),
          ListTile(leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrderScreen.routename);
            },
          ),
          Divider(),
          ListTile(leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
