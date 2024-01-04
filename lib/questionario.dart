import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

class Questionario extends StatefulWidget {
  Questionario({super.key});

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  var _perguntaSelecionada = 0;
  var pontosTotais = 0;

  void _responder({required int pontuacao}) {
    if (onPerg) {
      setState(() {
        _perguntaSelecionada++;
        pontosTotais += pontuacao;
      });
    }
  }

  void _reset() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  bool get onPerg {
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ponto': 1},
        {'texto': 'Vermelho', 'ponto': 2},
        {'texto': 'Verde', 'ponto': 3},
        {'texto': 'Branco', 'ponto': 4}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 1},
        {'texto': 'Cobra', 'ponto': 2},
        {'texto': 'Elefante', 'ponto': 3},
        {'texto': 'Leão', 'ponto': 4}
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'ponto': 1},
        {'texto': 'João', 'ponto': 2},
        {'texto': 'Leo', 'ponto': 3},
        {'texto': 'Pedro', 'ponto': 4},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas =
        onPerg ? _perguntas[_perguntaSelecionada]['respostas'] : [];

    return onPerg
        ? Column(
            children: [
              Questao(_perguntas[_perguntaSelecionada]['texto']),
              ...respostas
                  .map((e) => Resposta(
                        texto: e['texto'],
                        quandoSelecionado: () =>
                            _responder(pontuacao: e['ponto']),
                      ))
                  .toList()
            ],
          )
        : Resultado(
            pontuacaoTotal: pontosTotais,
            reset: _reset,
          );
  }
}
