import 'dart:io';

class Product{

  final String _name;
  final String _description;
  final String _seller;
  final String _category;
  final double _price;
  final File _preview;

  Product(
      this._name,
      this._description,
      this._seller,
      this._category,
      this._price,
      this._preview
      );

}
