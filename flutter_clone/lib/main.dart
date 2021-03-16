import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone/app/models/revenda_model.dart';
import 'package:flutter_clone/app/pages/revenda_page.dart';
import 'package:flutter_clone/app/pages/selecionar_produtos.dart';
import 'package:device_preview/device_preview.dart';


void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RevendaPage(),
      routes: {
        SelecionarProdutoScreen.routerName: (_) {
          var revenda = ModalRoute.of(_)!.settings.arguments as RevendaModel;
          return SelecionarProdutoScreen(revenda: revenda);
        }
      },
    );
  }
}


