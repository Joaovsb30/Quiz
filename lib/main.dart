import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Questionario(),
        ),
      ),
    );
  }
}
