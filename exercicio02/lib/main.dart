import 'package:flutter/material.dart';
void main() => runApp(const App());
class App extends StatelessWidget { const App({super.key}); @override Widget build(BuildContext c) => MaterialApp(debugShowCheckedModeBanner:false, home: const Tela()); }
class Tela extends StatefulWidget { const Tela({super.key}); @override State<Tela> createState()=>_TelaState(); }
class _TelaState extends State<Tela> {
  final nome=TextEditingController(), idade=TextEditingController(); String mensagem='';
  void verificar(){ final valor=int.tryParse(idade.text); setState(()=>mensagem=nome.text.trim().isEmpty||valor==null?'Informe nome e uma idade válida.':valor>=18?'${nome.text} é maior de idade.':'${nome.text} é menor de idade.'); }
  void limpar(){nome.clear();idade.clear();setState(()=>mensagem='');} @override void dispose(){nome.dispose();idade.dispose();super.dispose();}
  @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Verificador de idade')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:nome,decoration:const InputDecoration(labelText:'Nome')),TextField(controller:idade,keyboardType:TextInputType.number,decoration:const InputDecoration(labelText:'Idade')),const SizedBox(height:20),Row(mainAxisAlignment:MainAxisAlignment.center,children:[ElevatedButton(onPressed:verificar,child:const Text('Verificar')),const SizedBox(width:12),ElevatedButton(onPressed:limpar,child:const Text('Limpar'))]),const SizedBox(height:24),Text(mensagem)])));
}
