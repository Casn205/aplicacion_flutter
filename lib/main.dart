import 'package:flutter/material.dart';

import 'Cliente.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaClientes(),
    );
  }
}

class ListaClientes extends StatelessWidget {
  
  final List<Cliente> clientes = [
    Cliente(nombre: 'Juan', apellido: 'Pérez', edad: 30, telefono: 123456789),
    Cliente(nombre: 'Ana', apellido: 'García', edad: 25, telefono: 987654321),
    Cliente(nombre: 'Luis', apellido: 'Martínez', edad: 40, telefono: 456123789),
    Cliente(nombre: 'Maria', apellido: 'Rodríguez', edad: 28, telefono: 753159486),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          final cliente = clientes[index];
          return ListTile(
            title: Text('${cliente.nombre} ${cliente.apellido}'),
            subtitle: Text('Edad: ${cliente.edad}'),
            onTap: () {
              // Al hacer clic en el cliente, se navega a la pantalla de detalles
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesCliente(cliente: cliente),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetallesCliente extends StatelessWidget {
  final Cliente cliente;

  DetallesCliente({required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${cliente.nombre} ${cliente.apellido}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nombre: ${cliente.nombre} ${cliente.apellido}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Edad: ${cliente.edad}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Teléfono: ${cliente.telefono}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

