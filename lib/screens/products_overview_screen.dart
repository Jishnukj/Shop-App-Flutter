import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/screens/Cart_screen.dart';
enum FilterOptions{
  Favrites,
  All
}
class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlrFav=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedvalue){
            setState(() {
              if(selectedvalue==FilterOptions.Favrites){
                _showOnlrFav=true;
              }else{
                _showOnlrFav=false;
              }
            });

            },
            itemBuilder: (_)=>[
              PopupMenuItem(child: Text("Only Favorites"),value: FilterOptions.Favrites,),
              PopupMenuItem(child: Text("Show all"),value: FilterOptions.All,),

            ],
          ),
          Consumer<Cart>(builder: (_,cart,ch)=> Badge(child: ch,
          value: cart.itemcount.toString(),),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            ),

          )

        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlrFav),
    );
  }
}
