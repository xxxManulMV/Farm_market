import 'package:farm_market/ui/shared/typography/h1_roboto.dart';
import 'package:farm_market/ui/shared/typography/h2_roboto.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatefulWidget {
  
  final String name;
  final String description;
  final String seller;
  final String price;



  const ProductCard({
    Key? key,
    required this.name,
    required this.description,
    required this.seller,
    required this.price
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        
        padding: const EdgeInsets.all(16),
        
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
          ],
          color: Colors.white,

        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            //Name
            H1Roboto(label: widget.name),

            //Description
            Text(widget.description),

            //Seller
            Text(widget.seller),

            //Price
            Text(widget.price.toString()),

            //Add to card
            ElevatedButton(
              child: const Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                   Icon(Icons.add_shopping_cart),

                   SizedBox(width: 4,),

                   H2Roboto(label: 'Добавить'),

                ],
              ),
              onPressed: () {debugPrint('Added to card');}
            )

          ]
        ),

      ),
    );
  }
}
