import 'package:flutter/material.dart';
import 'added_list.dart';

class AddedProductsPage extends StatefulWidget {
  const AddedProductsPage({super.key});

  @override
  State<AddedProductsPage> createState() => _AddedProductsPageState();
}

class _AddedProductsPageState extends State<AddedProductsPage> {
  @override
  Widget build(BuildContext context) {
    double total = addedProducts.fold(
      0,
          (sum, product) => sum + product.price,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits sélectionnés"),
      ),

      body: Column(
        children: [
          Expanded(
            child: addedProducts.isEmpty
                ? const Center(
              child: Text(
                "Aucun produit ajouté pour le moment.",
                style: TextStyle(fontSize: 16),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: addedProducts.length,
              itemBuilder: (context, index) {
                final p = addedProducts[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.teal,
                    ),

                    title: Text(
                      p.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "${p.price.toStringAsFixed(2)} DT",
                    ),

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          addedProducts.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Total
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: const Color(0xFFE0E0E0),
                ),
              ),
            ),
            child: Column(
              children: [git log --oneline -1
                Text(
                  "Nombre de produits : ${addedProducts.length}",
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 10),

                Text(
                  "Total : ${total.toStringAsFixed(2)} DT",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),

                const SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      addedProducts.clear();
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Liste vidée"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete_sweep),
                  label: const Text("Vider la liste"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D1117),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}