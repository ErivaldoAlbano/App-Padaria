import 'package:flutter/material.dart';

class ModalAdicionarProduto extends StatefulWidget {
  final Map<String, dynamic> produto;
  final Map<String, String> padaria;

  const ModalAdicionarProduto({
    super.key,
    required this.produto,
    required this.padaria,
  });

  @override
  State<ModalAdicionarProduto> createState() => _ModalAdicionarProdutoState();
}

class _ModalAdicionarProdutoState extends State<ModalAdicionarProduto> {
  int quantidade = 1;

  @override
  Widget build(BuildContext context) {
    final preco = widget.produto['preco'];
    final total = preco * quantidade;

    const castanhoClaro = Color(0xFFBC8C4C);
    const fundoBege = Color(0xFFF5EBD9);
    const marromEscuro = Color(0xFF5D4037);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        top: 25,
        left: 15,
        right: 15,
      ),
      child: Material(
        color: fundoBege,
        borderRadius: BorderRadius.circular(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                widget.produto['nome'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: marromEscuro,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.produto['imagem'],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.storefront_outlined, color: castanhoClaro),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.padaria['nome']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: marromEscuro,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Quantidade',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: marromEscuro,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    icon: const Icon(Icons.remove),
                    style: IconButton.styleFrom(
                      backgroundColor: castanhoClaro.withOpacity(0.2),
                      foregroundColor: castanhoClaro,
                    ),
                    onPressed: () {
                      if (quantidade > 1) {
                        setState(() {
                          quantidade--;
                        });
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '$quantidade',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: marromEscuro,
                      ),
                    ),
                  ),
                  IconButton.filledTonal(
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(
                      backgroundColor: castanhoClaro.withOpacity(0.2),
                      foregroundColor: castanhoClaro,
                    ),
                    onPressed: () {
                      setState(() {
                        quantidade++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Total a pagar',
                style: TextStyle(color: marromEscuro, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              Text(
                'Kz ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: castanhoClaro,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: castanhoClaro,
                        side: const BorderSide(color: castanhoClaro),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancelar'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: castanhoClaro,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Adicionar'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
