import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAuto extends StatefulWidget {
  const AddAuto({super.key});

  @override
  State<AddAuto> createState() => _AddAutoState();
}

class _AddAutoState extends State<AddAuto> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _polizaController = TextEditingController();
  final TextEditingController _fechaExpController = TextEditingController();
  final TextEditingController _imagenController = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Método para agregar un nuevo auto
  Future<void> _addAuto() async {
    if (_nombreController.text.isNotEmpty &&
        _modeloController.text.isNotEmpty &&
        _polizaController.text.isNotEmpty &&
        _fechaExpController.text.isNotEmpty &&
        _imagenController.text.isNotEmpty) {
      try {
        await _db.collection('autos').add({
          'nombre': _nombreController.text,
          'modelo': _modeloController.text,
          'poliza': _polizaController.text,
          'fecha de expiracion': _fechaExpController.text,
          'imagen': _imagenController.text,
        });
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al agregar auto: $e')),
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
        title: const Text('Agregar Auto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  hintText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Modelo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _modeloController,
                decoration: const InputDecoration(
                  hintText: 'Modelo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Póliza',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _polizaController,
                decoration: const InputDecoration(
                  hintText: 'Poliza',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Fecha de Expiración',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _fechaExpController,
                decoration: const InputDecoration(
                  hintText: 'Fecha: 26/11/2024',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'URL de la Imagen',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _imagenController,
                decoration: const InputDecoration(
                  hintText: 'Imagen URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _addAuto,
                  child: const Text('Guardar Auto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _modeloController.dispose();
    _polizaController.dispose();
    _fechaExpController.dispose();
    _imagenController.dispose();
    super.dispose();
  }
}
