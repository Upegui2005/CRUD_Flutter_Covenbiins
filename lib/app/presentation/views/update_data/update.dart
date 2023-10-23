import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UpdateUsuario extends StatefulWidget {
  const UpdateUsuario({super.key});

  @override
  State<UpdateUsuario> createState() => _UpdateUsuarioState();
}

class _UpdateUsuarioState extends State<UpdateUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Text("Update"),
        );
    );
  }
}
