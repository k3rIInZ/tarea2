import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _selectedOperation = 'Suma';
  double? _result;

  void _calculate() {
    final double num1 = double.tryParse(_firstNumberController.text) ?? 0;
    final double num2 = double.tryParse(_secondNumberController.text) ?? 0;

    switch (_selectedOperation) {
      case 'Suma':
        setState(() {
          _result = num1 + num2;
        });
        break;
      case 'Resta':
        setState(() {
          _result = num1 - num2;
        });
        break;
      case 'Multiplicacion':
        setState(() {
          _result = num1 * num2;
        });
        break;
      case 'Division':
        setState(() {
          if (num2 != 0) {
            _result = num1 / num2;
          } else {
            _result = null; 
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Aritméticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNumberController,
              decoration: InputDecoration(
                labelText: 'Primer Valor',
                hintText: 'Ingrese un número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _secondNumberController,
              decoration: InputDecoration(
                labelText: 'Segundo Valor',
                hintText: 'Ingrese un número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedOperation,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
              items: <String>['Suma', 'Resta', 'Multiplicacion', 'Division']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _result != null ? 'Resultado: $_result' : 'Resultado: Error',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
