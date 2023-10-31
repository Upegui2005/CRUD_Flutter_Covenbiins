import 'package:covenbiins_2/app/presentation/views/publicar/publicar_view.dart';
import 'package:flutter/material.dart';

import '../home/home_view.dart';
import '../register/register_view.dart';

class MenuView extends StatelessWidget {
  static const String name = 'menu_view';
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BotonCuadrado(
                  texto: 'Inmuebles',
                  onPressed: () {},
              ),
              SizedBox(height: 20),
              BotonCuadrado(
                texto: 'Usuarios',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                },
              ),
              SizedBox(height: 20),
              BotonCuadrado(
                texto: 'Registrarse',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView()));
                },
              ),
              SizedBox(height: 20),
              BotonCuadrado(
                texto: 'Publicar',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PublicarView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BotonCuadrado extends StatelessWidget{
  final String texto;

  final VoidCallback? onPressed;

  BotonCuadrado({required, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          texto,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

}

