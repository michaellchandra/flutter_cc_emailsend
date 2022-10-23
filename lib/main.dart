import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cc_emailsend/services/services.dart';
import 'dart:convert';

import 'package:flutter_cc_emailsend/shared/shared.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salah Jurusan Email Sender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Salah Jurusan Email Sender'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final controllerEmail = TextEditingController();
  
  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(children: [
              SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
                controller: controllerEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(!EmailValidator.validate(value.toString())){
                    return 'Email tidak valid!';
                  } else {
                    return null;
                  }
                },
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sendingEmail.sendMail(controllerEmail.text.toString()).then((value){
            var hasil = json.decode(value.body);
            Fluttertoast.showToast(
              msg: hasil['message'],
              backgroundColor: hasil['code'] == 200 ?Colors.green : Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_LONG,
              
              );

          });

          
        },

        tooltip: 'send',
        child: const Icon(Icons.send),
        
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
