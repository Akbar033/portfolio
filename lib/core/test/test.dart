import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String description;
  final List<String> images;

  ProductModel({
    required this.name,
    required this.description,
    required this.images,
  });

  factory ProductModel.fromJson(Map<StepTween, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }
}

//product screen
class ProductScreen extends StatelessWidget {
  final List<ProductModel>? products;
  const ProductScreen({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Products'),
        Column(
          children: products!.map((product) {
            return ProductCard(product: product);
          }).toList(),
        ),
      ],
    );
  }
}

//card for product model
class ProductCard extends StatelessWidget {
  ProductModel? product;
  ProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //product name
        Text(product?.name ?? ''),
        //Description
        Text(product?.description ?? ''),
        //images
        ListView.builder(
          itemCount: product?.images.length,
          itemBuilder: (context, index) {
            return Image.network(product?.images[index] ?? '');
          },
        ),
      ],
    );
  }
}
