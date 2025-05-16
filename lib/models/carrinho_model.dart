import 'package:flutter/foundation.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _itens = [];

  List<Map<String, dynamic>> get itens => _itens;

  void adicionarItem(Map<String, dynamic> item) {
    _itens.add(item);
    notifyListeners(); // notifica quem estiver usando
  }

  void limparCarrinho() {
    _itens.clear();
    notifyListeners();
  }

  double get total {
    return _itens.fold(0.0, (soma, item) {
      return soma + (item['preco'] * item['quantidade']);
    });
  }
}