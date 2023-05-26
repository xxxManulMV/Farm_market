import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Seller {
  int? sellerId;
  String sellerLastName;
  String sellerFirstName;
  String sellerMiddleName;
  String sellerUsername;
  String sellerPassword;
  String sellerEmail;

  Seller({
    this.sellerId,
    required this.sellerLastName,
    required this.sellerFirstName,
    required this.sellerMiddleName,
    required this.sellerUsername,
    required this.sellerPassword,
    required this.sellerEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'seller_id': sellerId,
      'last_name': sellerLastName,
      'first_name': sellerFirstName,
      'middle_name': sellerMiddleName,
      'username': sellerUsername,
      'password': sellerPassword,
      'email': sellerEmail,
    };
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      sellerId: map['user_id'],
      sellerLastName: map['last_name'],
      sellerFirstName: map['first_name'],
      sellerMiddleName: map['middle_name'],
      sellerUsername: map['username'],
      sellerPassword: map['password'],
      sellerEmail: map['email'],
    );
  }
}
