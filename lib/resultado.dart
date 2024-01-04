import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() reset;
  final int pontuacaoTotal;
  const Resultado({
    super.key,
    required this.reset,
    required this.pontuacaoTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              'Parabens! Fim do questionário você obteve $pontuacaoTotal pontos totais.'),
          TextButton(
            onPressed: reset,
            child: const Text('Reiniciar'),
          )
        ],
      ),
    );
  }
}
