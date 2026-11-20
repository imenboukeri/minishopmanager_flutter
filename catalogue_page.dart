import 'package:flutter/material.dart';
import 'product.dart';
import 'added_list.dart';
import 'added_products_page.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  final List<Product> catalogue = const [
    Product("Smartphone Samsung", 1200),
    Product("Casque Bluetooth", 150),
    Product("Montre connectée", 300),
    Product("Chargeur USB-C", 40),
    Product("Clavier sans fil", 80),
    Product("Souris Bluetooth", 65),
    Product("Écouteurs sans fil", 110),
    Product("Support téléphone", 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MiniShop Manager",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddedProductsPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF0D1117),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenue dans votre boutique !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Gérez vos produits simplement.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Catalogue des produits",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1117),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: catalogue.length,
              itemBuilder: (context, index) {
                final p = catalogue[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),

                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5F5F2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFF00BFA6),
                        size: 27,
                      ),
                    ),

                    title: Text(
                      p.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${p.price.toStringAsFixed(2)} DT",
                        style: const TextStyle(
                          color: Color(0xFF00A58C),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        color: Color(0xFF00BFA6),
                        size: 30,
                      ),
                      onPressed: () {
                        addedProducts.add(p);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${p.name} ajouté à la liste"),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}