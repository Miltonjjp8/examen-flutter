import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Listar personas
Future<List> getPeople() async {
  List people = [];

  CollectionReference peopleCollection = db.collection('people');

  QuerySnapshot queryPeople = await peopleCollection.get();

  for (var doc in queryPeople.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": doc.id,
    };
    people.add(person);
  }

  return people;
}

//Agregar personas
Future<void> addPeople(String name) async {
  await db.collection('people').add({
    'name': name,
  });
}

//Actualizar personas
Future<void> updatePeople(String uid, String newName) async {
  await db.collection('people').doc(uid).set({"name": newName});
}

//Eliminar personas
Future<void> deletePeople(String uid) async {
  await db.collection("people").doc(uid).delete();
}

// Obtener lista de gastos
Future<List> getGastos() async {
  List gastos = [];
  CollectionReference gastosCollection = db.collection('gastos');

  QuerySnapshot queryGastos = await gastosCollection.get();

  for (var doc in queryGastos.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final gasto = {
      "descripcion": data['descripcion'],
      "precio": data['precio'],
      "uid": doc.id,
    };
    gastos.add(gasto);
  }

  return gastos;
}

// Listar autos
Future<List> getAutos() async {
  List autos = [];

  CollectionReference autosCollection = db.collection('autos');

  QuerySnapshot queryAutos = await autosCollection.get();

  for (var doc in queryAutos.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final auto = {
      "nombre": data['nombre'],
      "modelo": data['modelo'],
      "poliza": data['poliza'],
      "fecha_de_expiracion": data['fecha de expiracion'],
      "imagen": data['imagen'],
      "uid": doc.id,
    };
    autos.add(auto);
  }

  return autos;
}

// Agregar un auto
Future<void> addAuto(Map<String, dynamic> autoData) async {
  await db.collection('autos').add(autoData);
}

// Actualizar un auto
Future<void> updateAuto(String uid, Map<String, dynamic> updatedData) async {
  await db.collection('autos').doc(uid).update(updatedData);
}

// Eliminar un auto
Future<void> deleteAuto(String uid) async {
  await db.collection('autos').doc(uid).delete();
}
