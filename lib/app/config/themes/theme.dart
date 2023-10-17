import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF000000);

// Seleccionar los colores de su aplicación NO UTILIZAR LOS COLORES DE EJEMPLO
const List<Color> _colorTheme=[
  _customColor,
  Color(0xFF000000),
  Color(0xFFEBEBEB),
  Color(0xFF0D31ED),
  Color(0xFFFFFFFF),
  Color(0xFFCFCFCF),
];

class AppTheme{
  final int selectedThemeColor;

  AppTheme({
    this.selectedThemeColor = 0,
  }):assert(selectedThemeColor >= 0 && selectedThemeColor < _colorTheme.length);

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedThemeColor],
      fontFamily: 'Odin Rounded',
      // textTheme define el estilo de los textos
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: _colorTheme[selectedThemeColor],
          fontSize: 20,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: _colorTheme[selectedThemeColor],
        foregroundColor: Colors.white,
      ),

    );
  }
}