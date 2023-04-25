import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class NewBody extends StatefulWidget {
  @override
  _NewBodyState createState() => _NewBodyState();
}

class _NewBodyState extends State<NewBody> {
  final List<String> _categoryOptions = [
    'Comida',
    'Eletrodoméstico',
    'Fármaco',
  ];

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Nome do produto: '),
        ),
        TextField(
            decoration: InputDecoration(labelText: 'Quantidade: '),
            keyboardType: TextInputType.number),
        DropdownButton(
          items: _categoryOptions.map((String option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          value: _selectedCategory,
          onChanged: (String? value) {
            setState(() {
              _selectedCategory = value;
            });
          },
          hint: Text('Selecione uma categoria'),
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Processando dados...'),
              ),
            );
          },
          child: Text('Cadastrar Produto'),
        )
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Produtos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Produtos'),
        ),
        body: NewBody(),
      ),
    );
  }
}
