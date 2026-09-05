import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, home: const Tela());
}

class Tela extends StatefulWidget {
  const Tela({super.key});
  @override State<Tela> createState() => _TelaState();
}
class _TelaState extends State<Tela> {
  final nome = TextEditingController();
  final cidade = TextEditingController();
  String mensagem = '';
  void mostrar() => setState(() => mensagem = nome.text.trim().isEmpty || cidade.text.trim().isEmpty ? 'Preencha os dois campos.' : 'Olá, ${nome.text}! Você mora em ${cidade.text}.');
  void limpar() { nome.clear(); cidade.clear(); setState(() => mensagem = ''); }
  @override void dispose() { nome.dispose(); cidade.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Identificação do usuário')), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [TextField(controller: nome, decoration: const InputDecoration(labelText: 'Nome')), TextField(controller: cidade, decoration: const InputDecoration(labelText: 'Cidade')), const SizedBox(height: 20), Row(mainAxisAlignment: MainAxisAlignment.center, children: [ElevatedButton(onPressed: mostrar, child: const Text('Mostrar')), const SizedBox(width: 12), ElevatedButton(onPressed: limpar, child: const Text('Limpar'))]), const SizedBox(height: 24), Text(mensagem)])));
}
