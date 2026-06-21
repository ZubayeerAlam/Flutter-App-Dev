import 'package:flutter/material.dart';
import 'productControler.dart';
import 'model/productModel.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  ProductController productController = ProductController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    setState(() {
      productController.isLoading = true;
    });

    await productController.fetchProducts();

    setState(() {
      productController.isLoading = false;
    });
  }

  productDialog(Data? product) {
    final name = TextEditingController(text: product?.productName);
    final img = TextEditingController(text: product?.img);
    final qty = TextEditingController(text: product?.qty?.toString());
    final price = TextEditingController(text: product?.unitPrice?.toString());
    final total = TextEditingController(text: product?.totalPrice?.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product == null ? "Add Product" : "Update Product"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: img,
                decoration: InputDecoration(labelText: "Image"),
              ),
              TextField(
                controller: qty,
                decoration: InputDecoration(labelText: "Qty"),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(labelText: "Price"),
              ),
              TextField(
                controller: total,
                decoration: InputDecoration(labelText: "Total"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () async {
              final data = Data(
                sId: product?.sId,
                productName: name.text,
                img: img.text,
                qty: int.tryParse(qty.text) ?? 0,
                unitPrice: int.tryParse(price.text) ?? 0,
                totalPrice: int.tryParse(total.text) ?? 0,
                productCode: product?.productCode,
              );

              bool result;

              if (product == null) {
                result = await productController.createProducts(data);
              } else {
                result = await productController.updateProduct(data);
              }

              Navigator.pop(context);

              if (result) {
                await fetchData();
                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      product == null
                          ? "Created Successfully"
                          : "Updated Successfully",
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Something went wrong")));
              }
            },
            child: Text(product == null ? "Save" : "Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD App")),

      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(null),
        child: Icon(Icons.add),
      ),

      body: productController.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: productController.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = productController.products[index];

                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          product.img ?? "",
                          errorBuilder: (_, __, ___) => Icon(Icons.image),
                          fit: BoxFit.cover,
                        ),
                      ),

                      Text(product.productName ?? ""),
                      Text("৳${product.unitPrice}"),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => productDialog(product),
                          ),

                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await productController.deleteProduct(
                                product.sId!,
                              );

                              await fetchData();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
