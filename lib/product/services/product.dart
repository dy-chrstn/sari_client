import 'dart:convert';

import 'package:sari/product/model/product.dart';
import 'package:sari/token/services/token.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

Future<ProductModel> getProduct(String productId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/product/get/$productId');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final product = ProductModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return product;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<List<ProductModel>> getProductList(String userId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/product/getAll/$userId');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final productList = <ProductModel>[];
      data['response']
          .forEach((e) => productList.add(ProductModel.fromJson(e)));
      // Logger().d(data['response']);

      return productList;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<ProductModel> createProduct(
    String userId,
    String name,
    String description,
    List<String> price,
    String imageUrl,
    List<String> sizes,
    List<String> types,
    String createdBy,
    String updatedBy,
    DateTime createdAt,
    DateTime updatedAt,
    String srp,
    String dp) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/product/register/$userId');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price,
          'userId': userId,
          'imageUrl': imageUrl,
          'sizes': sizes,
          'types': types,
          'createdBy': createdBy,
          'updatedBy': updatedBy,
          'createdAt': createdAt,
          'updatedAt': updatedAt,
          'srp': srp,
          'dp': dp
        }));
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final product = ProductModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return product;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<void> updateProduct(
    String productId,
    String name,
    String description,
    List<String> price,
    String userId,
    String imageUrl,
    List<String> sizes,
    List<String> types,
    String createdBy,
    String updatedBy,
    DateTime createdAt,
    DateTime updatedAt,
    String srp,
    String dp) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/product/update/$productId');
    final response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'userId': userId,
          'name': name,
          'description': description,
          'price': price,
          'imageUrl': imageUrl,
          'sizes': sizes,
          'types': types,
          'createdBy': createdBy,
          'updatedBy': updatedBy,
          'createdAt': createdAt,
          'updatedAt': updatedAt,
          'srp': srp,
          'dp': dp
        }));
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      // final product = ProductModel.fromJson(data['response']);
      // Logger().d(data['response']);
      return data['messages']['message'];
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<void> deleteProduct(String productId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/product/delete/$productId');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      // Logger().d(data['response']);

      return data['response'];
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}
