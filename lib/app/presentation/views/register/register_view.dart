import 'package:covenbiins_2/Mongo_Db_Model.dart';
import 'package:covenbiins_2/app/presentation/views/register/widgets/my_check_box.dart';
import 'package:covenbiins_2/dbHelper/mondodb.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

import '../../widgets/form_text_field.dart';
import '../../widgets/my_button_form.dart';

class RegisterView extends StatefulWidget {

  static const String name = 'register_view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  var emailAddress = TextEditingController();
  var visiblePassword = TextEditingController();

  bool _checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Logo
                  SvgPicture.asset('assets/images/logo1.svg',
                    alignment: Alignment.topCenter,
                    width: 180,
                  ),

                  Text('Register',
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  MyFormTextField(
                    labelText: 'Correo Electronico',
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    suffixIcon: false,
                    controller: emailAddress,
                  ),
                  const SizedBox(height: 20,),
                  MyFormTextField(
                    labelText: 'Contraseña',
                    hintText: 'Enter your password',
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: false,
                    controller: visiblePassword,
                  ),
                  const SizedBox(height: 20,),
                  MyFormTextField(
                    labelText: 'Contraseña',
                    hintText: 'Enter again your password',
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: false,
                    controller:   visiblePassword,
                  ),

                  const SizedBox(height: 20,),
                  MyCheckBox(
                      value: _checkBox,
                      onChanged: (bool? value){
                        setState(() {
                          _checkBox = value!;
                        });
                      }
                  ),

                  const SizedBox(height: 20,),
                  //Form
                  //Button
                  MyButtonForm(
                    text: 'Register',
                    onTab: () {
                      if(_checkBox == false){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('No aceptaste los terminos y condiciones'),
                            backgroundColor: Theme.of(context).colorScheme.error,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                      else{
                        _registarData(emailAddress.text,visiblePassword.text);
                      }
                    },
                  ),

                  const SizedBox(height: 20,),

                  MyButtonForm(
                    text: 'Prueba',
                    onTab: () {
                      _fakeData();
                    },
                  )
                  //TextButton
                ],
              ),
            ),
          )
      ),
    );
  }

  Future<void> _registarData(String email, String password) async {
    var id = M.ObjectId();
    final data = MongoDbModel(
        id: id,
        email: email,
        password: password,
    );
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Insert ID ${id.$oid}")
        )
    );
    _clearAll();
  }

  void _clearAll() {
    emailAddress.text = "";
    visiblePassword.text = "";
  }

  void _fakeData() {
    setState(() {
      emailAddress.text = faker.internet.email();
      visiblePassword.text = faker.internet.password();
    });
  }
}