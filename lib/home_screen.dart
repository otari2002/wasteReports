// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waste_go/reports_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cinController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    cinController.dispose();
    nameController.dispose();
    adresseController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var reportService = context.watch<ReportsServices>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: Text(''),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('New Note'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: cinController,
                      decoration: const InputDecoration(
                        hintText: 'Enter cin',
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter name',
                      ),
                    ),
                    TextField(
                      controller: adresseController,
                      decoration: const InputDecoration(
                        hintText: 'Enter adresse',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      reportService.addReport(
                        cinController.text,
                        nameController.text,
                        adresseController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
