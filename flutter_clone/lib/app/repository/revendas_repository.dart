import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_clone/app/models/revenda_model.dart';

class RevendaRepository {
  Future<List<RevendaModel>> searchRevenda() async {
    var dados = await rootBundle.loadString('data/dados.json');
    var revendas = json.decode(dados) as List;
    return revendas.map((revend) => RevendaModel.fromMap(revend)).toList();
  }
}
