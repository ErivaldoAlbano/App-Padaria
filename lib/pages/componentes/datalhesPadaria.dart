import 'package:flutter/material.dart';
import './modal_adicionar_produto.dart';

class DetalhesPadaria extends StatelessWidget {
  final Map<String, String> padaria;

  const DetalhesPadaria({super.key, required this.padaria});

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;

    final Map<String, List<Map<String, dynamic>>> produtosPorCategoria = {
      'Pão francês': [
        {
          'nome': 'Pão francês tradicional',
          'imagem': 'assets/images/produtos/pao_frances.jpg',
          'preco': 70,
        },
        {
          'nome': 'Pão francês tradicional',
          'imagem': 'assets/pao.png',
          'preco': 170,
        },
      ],
      'Croissant': [
        {
          'nome': 'Croissant de queijo',
          'imagem': 'assets/images/produtos/croissant_queijo.jpg',
          'preco': 800.000,
        },
        {
          'nome': 'Croissant de chocolate',
          'imagem': 'assets/images/produtos/croissant_chocolate.jpg',
          'preco': 1039.500,
        },
      ],
      'Bolo de chocolate': [
        {
          'nome': 'Fatia de bolo',
          'imagem': 'assets/images/produtos/bolo_chocolate.jpg',
          'preco': 899.400,
        },
      ],
      'Pastel de nata': [
        {
          'nome': 'Pastel de nata tradicional',
          'imagem': 'assets/images/produtos/pastel_nata.jpg',
          'preco': 250,
        },
      ],
    };

    return Padding(
      padding: EdgeInsets.only(top: alturaTela * 0.10),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 1.0,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: controller,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    padaria['nome']!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  padaria['imagem']!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                padaria['endereco']!,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              const Text(
                'Produtos disponíveis:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              ...produtosPorCategoria.entries.map((entry) {
                final categoria = entry.key;
                final produtos = entry.value;

                return ExpansionTile(
                  title: Text(categoria),
                  // leading: const Icon(Icons.shopping_basket_outlined),
                  children: produtos.map((produto) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Image.asset(
                          produto['imagem'],
                          width: 90,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        title: Text(produto['nome']),
                        subtitle: Text(
                          'Preço: Kz${produto['preco'].toStringAsFixed(2)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            _mostrarModalAdicionar(context, produto);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarModalAdicionar(
    BuildContext context,
    Map<String, dynamic> produto,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => ModalAdicionarProduto(
        produto: produto,
        padaria: padaria,
      ),
    );
  }
}
