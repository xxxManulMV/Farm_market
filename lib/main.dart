import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:farm_market/chechen_farm_marketplace_app.dart';


void main () {

  //Setup native android toolbar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  runApp(const ChechenFarmMarketplaceApp());

}