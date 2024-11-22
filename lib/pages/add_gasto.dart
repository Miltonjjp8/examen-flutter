import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddGasto extends StatefulWidget {
  const AddGasto({super.key});

  @override
  State<AddGasto> createState() => _AddGastoState();
}

class _AddGastoState extends State<AddGasto> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Método para agregar un nuevo gasto
  Future<void> _addGasto() async {
    if (_descripcionController.text.isNotEmpty &&
        _precioController.text.isNotEmpty) {
      try {
        await _db.collection('gastos').add({
          'descripcion': _descripcionController.text,
          'precio': _precioController.text,
        });
        Navigator.pop(context); // Vuelve a la pantalla anterior
      } catch (e) {
        // Manejo de errores
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al agregar gasto: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Gasto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Descripción',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                hintText: 'Descripcion',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Precio',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _precioController,
              decoration: const InputDecoration(
                hintText: 'Precio',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _addGasto,
                child: const Text('Guardar Gasto'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }
}
