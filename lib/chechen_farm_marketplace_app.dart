import 'package:flutter/material.dart';

import 'package:farm_market/ui/pages/explore_page.dart';


class ChechenFarmMarketplaceApp extends StatelessWidget {
  const ChechenFarmMarketplaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      //App base setup
      debugShowCheckedModeBanner: false,

      //Default start page
      home: ExplorePage(),

    );
  }
}
