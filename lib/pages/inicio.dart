import 'package:flutter/material.dart';
import 'componentes/datalhesPadaria.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  final List<Map<String, String>> padarias = const [
    {
      'nome': 'Padaria Pão Quente',
      'endereco': 'Rua das Flores',
      'imagem': 'assets/images/padaria1.jpg',
    },
    {
      'nome': 'Padaria da Esquina',
      'endereco': 'Av. Anibal de Melo',
      'imagem': 'assets/images/padaria2.jpeg',
    },
    {
      'nome': 'Delícias do Trigo',
      'endereco': 'Rua principal da minhota',
      'imagem': 'assets/images/padaria3.jpg',
    },
    {
      'nome': 'Padaria dos Laureanos',
      'endereco': 'Rua dos Laureanos',
      'imagem': 'assets/images/padaria4.jpg',
    },
  ];

  static const Color corPrincipal = Color.fromARGB(255, 235, 165, 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
          child: Column(
            children: [
              const Text(
                'Comece o dia com o melhor pão da cidade!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset('assets/pao.png', fit: BoxFit.contain),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corPrincipal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Ação de login
                    },
                    child: const Text('Login', style: TextStyle(fontSize: 16)),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: corPrincipal,
                      side: const BorderSide(color: corPrincipal, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Ação de pedidos
                    },
                    child: const Text(
                      'Fazer pedido agora',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: padarias.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final padaria = padarias[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder:
                              (context) => DetalhesPadaria(padaria: padaria),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: Image.asset(
                              padaria['imagem']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              padaria['nome']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              padaria['endereco']!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
