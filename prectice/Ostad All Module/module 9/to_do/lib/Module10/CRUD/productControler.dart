import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/productModel.dart';
import 'utilits/utilitis.dart';

class ProductController {
  List<Data> products = [];
  bool isLoading = false;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
    }
  }

  Future<bool> createProducts(Data data) async {
    final response = await http.post(
      Uri.parse(Urls.createProduct),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": DateTime.now().millisecondsSinceEpoch,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice
      }),
    );
    // Check  response status code
    return response.statusCode == 200;
  }

  Future<bool> updateProduct(Data data) async {
    final response = await http.post(
      Uri.parse(Urls.updateProduct(data.sId!)),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": data.productCode,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice
      }),
    );
    return response.statusCode == 200;
  }

  Future<bool> deleteProduct(String id) async {
    final response = await http.get(
      Uri.parse(Urls.deleteProduct(id)),
    );
    return response.statusCode == 200;
  }
}