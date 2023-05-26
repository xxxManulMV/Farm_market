import 'package:farm_market/ui/widgets/ShopPage/product_card.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:cupertino_listview/cupertino_listview.dart';

import 'package:flutter/material.dart';
import 'package:shaky_animated_listview/widgets/animated_gridview.dart';

import '../../domain/ProductService/product.dart';


class ShopPageViewModel extends ChangeNotifier {

  List<Product> _products = [];


}


class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  Color _activeColor = Color(0xFF000000);
  Color _inactiveColor = Color(0xFF969696);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Товары', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 2,
      ),

      body: ProductList(),

      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        iconSize: 24,
        animationCurve: Curves.easeInOutCubic,
        items: [
          FlashyTabBarItem(
              icon: Icon(Icons.explore),
              title: Text('Магазин'),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor
          ),
          FlashyTabBarItem(
              icon: Icon(Icons.local_grocery_store),
              title: Text('Карзина'),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor
          ),
          FlashyTabBarItem(
              icon: Icon(Icons.person),
              title: Text('Профиль'),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor/**/
          ),
        ]
      ),

    );
  }
}


//ProductList
class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}
class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return AnimatedGridView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 1,
      children: List.generate(10, (index) => ProductCard(
          name: 'Товар $index',
          description: 'Описание',
          seller: 'Продавец',
          price: 'Цена: ${10}' )
      ),
    );
  }
}
