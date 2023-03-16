import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productos_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-b8018-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  final storage = new FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    this.loadProducts();
  }
  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json',{
      'auth': await storage.read(key: 'token') ?? ' '
    }
    
    );
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();
    return this.products;
    // print(this.products[0].name);

    //print(productsMap);
  }

  Future saveOrCreateProduc(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //es neseasio crear
      await this.createProduct(product);
    } else {
      //actualizar
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json',{
       'auth': await storage.read(key: 'token') ?? ' '
    });
    final resp = await http.put(url, body: product.toJson(),);
    final decodeData = resp.body;

    //  print(decodeData);
    //actualizar el listado d e los productos
    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json',{
       'auth': await storage.read(key: 'token') ?? ' '
    });
    final resp = await http.post(url, body: product.toJson());
    final decodeData = jsonDecode(resp.body);

    product.id = decodeData['name'];
    this.products.add(product);

    //  print(decodeData);
    //crear un nuevo producto
//    print(decodeData);

    return product.id!;
    //return '';
  }

  void updateSelectedProductImage(String path) {
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;
    this.isSaving == true;
    notifyListeners();
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dklulbucu/image/upload?upload_preset=rookcnlh');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }
    this.newPictureFile = null;
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];

    print(resp.body);
  }

  //hacer el fech del produto
}
