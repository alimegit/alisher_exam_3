import 'package:alisher_exam3/data/network/api_provider.dart';
import 'package:alisher_exam3/data/network/network_response.dart';

class AppRepository {
  Future<NetworkResponse> getAllCategory() async =>
      await ApiProvider.fetchAllCategoryData();
  Future<NetworkResponse> getProductsByCategory(int id) async =>
      ApiProvider.ProductDataByCategory(id);
  Future<NetworkResponse> allProduct() async =>
    await  ApiProvider.allProducts();
}