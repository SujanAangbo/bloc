import 'dart:convert';

import 'package:bloc1/constants/exception/exception.dart';
import 'package:bloc1/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:bloc1/constants/constants.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    http.Response response = await http.get(Uri.parse(Constants.productUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonMap = jsonDecode(response.body);
      List products = jsonMap.map(
        (element) {
          return Product.fromJson(element as Map<String, dynamic>);
        },
      ).toList();

      return products as List<Product>;
    } else {
      // todo: handle exceptions
      throw ProductNotFoundException;
    }
  }
}
