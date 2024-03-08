import 'package:alisher_exam3/data/models/products_model.dart';
import 'package:alisher_exam3/data/network/network_response.dart';
import 'package:flutter/material.dart';

import '../data/models/my_repositories.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final AppRepository appRepository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Barcha mahsulotlar"),
      ),
      body: FutureBuilder<NetworkResponse>(
        future: appRepository.allProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductsModel> products =
                (snapshot.data as NetworkResponse).data as List<ProductsModel>;
            return GridView.count(
              crossAxisCount: 2,
              children: [
                ...List.generate(
                  products.length,
                  (index) => Container(
                    decoration: BoxDecoration(

                    ),
                    child: Image.network(products[index].imageUrl),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
