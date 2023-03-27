import 'package:birthday/compliment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login-background.png'), fit: BoxFit.cover)),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(30),
          width: width * 0.8,
          height: width,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/birthday-icon.png'),
                  radius: 50,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Ваше имя"),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите свое имя';
                    } else if (value.toLowerCase() != 'геля') {
                      return 'Подарок не ваш';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences.getInstance().then((value) =>
                              value.setString("name", nameController.text));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const ComplimentScreen(
                                    index: 0,
                                  )));
                        }
                      },
                      child: const Text('Хочу найти подарок')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
