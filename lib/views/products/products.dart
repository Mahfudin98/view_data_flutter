import 'package:flutter/material.dart';
import 'package:new_app/controller/products/products_controller.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products page"),
      ),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<ProductsController>(context, listen: false)
            .getDataProducts(),
        child: FutureBuilder(
          future: Provider.of<ProductsController>(context, listen: false)
              .getDataProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Consumer<ProductsController>(
              builder: (context, data, _) {
                return ListView.builder(
                  itemCount: data.dataProducts.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(data.dataProducts[i].name),
                          subtitle: Text(data.dataProducts[i].origin),
                          trailing: Text("Rp." + data.dataProducts[i].price),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
