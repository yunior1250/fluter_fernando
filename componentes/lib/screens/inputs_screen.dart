import 'package:componentes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Junior',
      'last_name': 'Garcia',
      'email': 'junior.garcia@gmail.com',
      'password': '123456',
      'role': 'admin	'
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text("Isnput y Form"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(children: [
              CustomInputField(
                labelText: 'Nombre',
                hintText: 'Nombre del Ususario',
                fromProperty: 'first_name',
                fromValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Apellido',
                hintText: 'Apellido del Ususario',
                fromProperty: 'last_name',
                fromValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Correo',
                hintText: 'Correo del Ususario',
                keyboardType: TextInputType.emailAddress,
                fromProperty: 'email',
                fromValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                  labelText: 'Contracenia',
                  hintText: 'Contracenia del Ususario',
                  obscureText: true,
                  fromProperty: 'password',
                  fromValues: formValues),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'Superuser',
                      child: Text('Superuser'),
                    ),
                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer'),
                    ),
                    DropdownMenuItem(
                      value: 'Jr. Developer',
                      child: Text('Jr. Developer'),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  }),
              ElevatedButton(
                
                child: const SizedBox(
                   
                
                    width: double.infinity,
                    child: Center(child: const Text("guardar"))),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!myFormKey.currentState!.validate()) {
                    print('foemulario no valido');
                    return;
                  }
                  //imprimir valores del formulario
                  print(formValues);
                },
              )
            ]),
          ),
        )));
  }
}
