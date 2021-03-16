import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_clone/app/components/buttonAgendamento.dart';
import 'package:flutter_clone/app/models/revenda_model.dart';


class SelecionarProdutoScreen extends StatefulWidget {
  static String routerName = '/selecionarProduto';
  final RevendaModel revenda;
  const SelecionarProdutoScreen({
    Key? key,
    required this.revenda,
  }) : super(key: key);

  @override
  _SelecionarProdutoScreenState createState() =>
      _SelecionarProdutoScreenState(revenda: revenda);
}

class _SelecionarProdutoScreenState extends State<SelecionarProdutoScreen> {
  final RevendaModel revenda;
  double valorTotal;

  _SelecionarProdutoScreenState({required this.revenda})
      : valorTotal = revenda.preco;

  var appBar = AppBar(
    title: Text('Selecionar Produto'),
    centerTitle: true,
  );

  var quantidade = 1;
  void adicionar() {
    setState(() {
      quantidade++;
      valorTotal = revenda.preco * quantidade;
    });
  }

  void remover() {
    if (quantidade > 0) {
      setState(() {
        quantidade--;
        valorTotal = revenda.preco * quantidade;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBar,
      body: Column(
        children: [
          _buildBar(),
          _buildSubTitulo(),
          _buildCardCompra(),
          ButtonAgendamento(),
        ],
      ),
    );
  }

  Container _buildBar() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.radio_button_checked, color: Colors.blue),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Comprar'),
                    ),
                  ],
                ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: [
                    Icon(Icons.radio_button_off, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Pagamento'),
                    )
                  ],
                ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: [
                    Icon(
                      Icons.radio_button_off,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Confirmação'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitulo() {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Container(
          height: 60,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          int.parse('0xFF' + '${revenda.cor}'),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Unigas - Botijão 13kg')
                  ],
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'R\$',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                '${valorTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildCardCompra() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                      ),
                    ),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.home, size: 40, color: Colors.grey),
                          Expanded(
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '${revenda.nome}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${revenda.nota}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        WidgetSpan(
                                          child: Icon(Icons.star,
                                              color: Colors.amber, size: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('${revenda.tempoMedio} min'),
                                  Container(
                                    color: Color(
                                      int.parse('0xFF' + '${revenda.cor}'),
                                    ),
                                    height: 25,
                                    width: 90,
                                    child: Center(
                                        child: Text(
                                      '${revenda.tipo}',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.1,
                    color: Colors.grey,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                      ),
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text('Botijão de 13kg'),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text('${revenda.nome}'),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "R\$ ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          "${revenda.preco.toStringAsPrecision(4).replaceAll('.', ',')}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Material(
                                color: Colors.grey, // button color
                                child: InkWell(
                                  // inkwell color
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Icon(Icons.remove),
                                  ),
                                  onTap: () {
                                    remover();
                                  },
                                ),
                              ),
                            ),
                            Stack(alignment: Alignment.center, children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Image.asset(
                                  'assets/images/prod_icon-gas.png',
                                  height: 86,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange),
                                child: Text(
                                  "$quantidade",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                            ClipOval(
                              child: Material(
                                color: Colors.grey, // button color
                                child: InkWell(
                                  // inkwell color
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Icon(Icons.add),
                                  ),
                                  onTap: () {
                                    adicionar();
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
