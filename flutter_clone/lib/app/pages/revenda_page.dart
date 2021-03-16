import 'package:flutter/material.dart';
import 'package:flutter_clone/app/components/tagMelhorPreco.dart';
import 'package:flutter_clone/app/models/revenda_model.dart';
import 'package:flutter_clone/app/repository/revendas_repository.dart';
import 'package:flutter_clone/app/pages/selecionar_produtos.dart';

class RevendaPage extends StatefulWidget {
  @override
  _RevendaPageState createState() => _RevendaPageState();
}

class _RevendaPageState extends State<RevendaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Escolha uma Revenda'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.swap_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Melhor Avaliação'),
                      Checkbox(
                        onChanged: (bool) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mais Rapido'),
                      Checkbox(
                        onChanged: (bool) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mais Barato'),
                      Checkbox(
                        onChanged: (bool) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.help),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Suporte'),
                ),
                PopupMenuItem(
                  child: Text('Termos'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Botijões de 13kg em:',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            'Av. Paulista, 1001',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Paulista, São Paulo, SP',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.blue,
                          ),
                          Text(
                            'Mudar',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<RevendaModel>>(
              future: RevendaRepository().searchRevenda(),
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container(
                      child: Center(
                        child: Text('Erro ao achar a revenda :('),
                      ),
                    );
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    var data = snapshot.data;
                    return ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (_, index) {
                        return _buildCardRevenda(data![index]);
                      },
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardRevenda(RevendaModel revenda) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        SelecionarProdutoScreen.routerName,
        arguments: revenda,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 3),
            child: (Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              height: 105,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                      color: Color(
                        int.parse('0xFF' + '${revenda.cor}'),
                      ),
                    ),
                    height: 105,
                    width: 35,
                    child: Center(
                        child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        '${revenda.tipo.toString()}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${revenda.nome.toString()}',
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Visibility(
                                visible: revenda.melhorPreco,
                                child: TagMelhorPreco(),
                              )
                            ],
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nota',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'Tempo Médio',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'Preço',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Column()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${revenda.nota.toString()}',
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                    Icon(Icons.star, color: Colors.yellow),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${revenda.tempoMedio.toString()}',
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      TextSpan(
                                        text: 'min',
                                        style: TextStyle(color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'R\$ ${revenda.preco.toStringAsPrecision(4).replaceAll('.', ',').toString()}',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
