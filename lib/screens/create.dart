import 'dart:convert';

import 'package:ezgym/models/registerModel.dart';
import 'package:ezgym/screens/home.dart';
import 'package:ezgym/screens/login.dart';
import 'package:ezgym/services/authApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/subscription.dart';

class Create extends StatefulWidget {
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  bool isChecked = false;
  int _currentStep = 0;
  int numChecked = 0;
  final _keyForm = GlobalKey<FormState>();
  final _keyForm2 = GlobalKey<FormState>();
  Color _colorContainer1 = Colors.transparent;
  Color _colorContainer2 = Colors.transparent;
  DateTime dateTime = DateTime.now();
  TextEditingController date = TextEditingController();

  String nombre = "";
  String apellido = "";
  String mail = "";
  String pwd = "";
  String tipo = "";
  String pic = "https://cdn-icons-png.flaticon.com/512/1361/1361728.png";
  List<Step> stepList() => [
    Step(
        title: const Text('Datos personales'),
        isActive: _currentStep >= 0,
        state: StepState.editing,
        content: Form(
        key: _keyForm,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombres',
              ),
              onChanged: (val){
                nombre= val;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Apellidos',
              ),
              onChanged: (val){
                apellido = val;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo electrónico',
              ),
              onChanged: (val){
                mail=val;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
              onChanged: (val){
                pwd = val;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirmar contraseña',
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    ),
    Step(
        title: Text('Suscripción'),
        isActive: _currentStep >= 1,
        state: StepState.editing,
        content: Center(
          child: SizedBox(
            height: 250,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0)),
                    child: InkWell(
                      onTap: () { 
                        setState(() {
                          isChecked = true;
                          _colorContainer1 = Colors.blue.withOpacity(0.3);
                          _colorContainer2 = Colors.transparent;
                          tipo = "Mensual";
                        });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*1,
                      height: 120,
                      color: _colorContainer1,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.55,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Plan Mensual',style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Prueba gratuita de 1 semana para nuevos usuarios, '
                                    'posterior al periodo de prueba el usuario '
                                    'debera pagar lo correspondiente por una prueba mensual S/ 20')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              child: const Text(
                                'S/. 20',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0)),
                    child: InkWell(
                      onTap: () { 
                        setState(() {
                          isChecked = true;
                          _colorContainer1 = Colors.transparent;
                          _colorContainer2 = Colors.blue.withOpacity(0.3);
                          tipo = "Anual";
                        });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*1,
                      height: 100,
                      color: _colorContainer2,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.55,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Plan Anual',style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Ahorra dos meses de suscripcion disfruta la aplicacion por un anio entero '
                                    'pagando por el precio de 10 meses')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              child: const Text(
                                'S/. 200',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ))
    ),
    Step(
        title: const Text('Pago'),
        isActive: _currentStep >= 2,
        state: StepState.complete,
        content: Form(
        key: _keyForm2,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                } else if (value.length != 16) {
                  return 'La número tarjeta debe tener 16 dígitos';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número de tarjeta',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre del titular',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              onTap:() {
                FocusScope.of(context).requestFocus(new FocusNode());
                setState(() {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => 
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      color: Colors.white,
                      child: Column (
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              date.text = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                            }, 
                            child: const Text("Hecho"),
                          ),
                          Expanded(
                            child: CupertinoDatePicker(
                            backgroundColor: Colors.white,
                            initialDateTime: dateTime,
                            onDateTimeChanged: (DateTime newDateTime) {
                              dateTime = newDateTime;
                            },
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.date,
                          ),
                          )
                        ],
                        )         
                      ),
                    );
                  }
                );
              },
              controller: date,
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fecha de vencimiento',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Código CVV',
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Crear cuenta', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black)
      ),
      backgroundColor: Colors.white,
      body: Stepper(
        steps: stepList(),
        type: StepperType.horizontal,
        elevation: 0,
        currentStep: _currentStep,
        onStepContinue: (){
          if ( (_keyForm.currentState!.validate() && _currentStep == 0) || (isChecked && _currentStep == 1)) {
            if( _currentStep < (stepList().length -1) ) {
              setState(() {
                _currentStep += 1;
              });
            }
          } else if (_keyForm2.currentState!.validate() && _currentStep == 2){
            register();
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
          }
        },
        onStepCancel: (){
          if (_currentStep!= 0) {
            if(_currentStep > 0){
            setState(() {
              _currentStep -= 1;
            });
            }
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
          }
          
        },
      ),
    );
  }

  void error(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Ocurrio un error al realizar el registro'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void success(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Exito'),
        content: const Text('registro existoso'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> register() async{
    dynamic creds = registerModel(name: nombre, surname: apellido, email: mail,photo: pic, password: pwd ,phone: "12345");
    dynamic res = await authApi.register(creds);
    var decoded = jsonDecode(res.body);
    print(decoded);
    dynamic sub = Subscription(type: tipo, start: '19/11/2023', end: '19/11/2024', userId: decoded['id']);

    dynamic response = await authApi.createSub(sub);

    if(response == 201){
      success();
    }
    else{
      error();
    }
    //print(response);


  }
}