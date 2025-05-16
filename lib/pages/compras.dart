import 'package:provider/provider.dart';
import 'models/carrinho_model.dart';

class Compras extends StatelessWidget {
  const Compras({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoModel>(context);
    final itens = carrinho.itens;
    final total = carrinho.total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        backgroundColor: const Color(0xFFBC8C4C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  final item = itens[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item['nome']),
                      subtitle: Text('Quantidade: ${item['quantidade']}'),
                      trailing: Text(
                        'Kz ${(item['quantidade'] * item['preco']).toStringAsFixed(2)}',
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kz ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBC8C4C),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Compra finalizada!')),
                  );
                },
                icon: const Icon(Icons.shopping_bag),
                label: const Text(
                  'Finalizar Compra',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
