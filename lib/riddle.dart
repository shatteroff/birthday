import 'package:birthday/success.dart';
import 'package:flutter/material.dart';

import 'description.dart';

class RiddleScreen extends StatefulWidget {
  const RiddleScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<RiddleScreen> createState() => _RiddleScreenState();
}

class _RiddleScreenState extends State<RiddleScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final List<List<String>> riddles = [
    [
      '''Здесь старики устраивают "съезд":
На лавки сев как куры на насест,
Власть предержащих яростно ругают,
Страшилками войны внучат пугают,
Хватаясь на обилие хворых мест,
О всех всегда всё по наслышке знают -
Кто с кем чего - когда и кто что ест.
Дверьми  и домофоном нас встречает
Уютный, чистый друг жильцов - ...''',
      'Подъезд'
    ],
    [
      '''В два ряда дома стоят,
Десять, сорок, сто подряд.
И квадратными глазами
Друг на друга глядят.''',
      'Улица'
    ],
    [
      '''По дорогам быстро мчится,
По степям летит, как птица!
Вслед за ним клубится пыль…
Едет что? ...''',
      'Автомобиль'
    ],
    [
      '''Разная бывает погода,
Пригодится тебе машина марки ...''',
      'Шкода'
    ],
    ['', 'Багажник']
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('login-background.png'), fit: BoxFit.cover)),
      child: Center(
        child: Container(
          width: width * 0.8,
          height: width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.index == 4)
                  Image.asset('img_1.png')
                else
                  Text(riddles[widget.index][0]),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Разгадка"),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите отгадку';
                    } else if (value.toLowerCase() !=
                        riddles[widget.index][1].toLowerCase()) {
                      return 'Неверный ответ';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SuccessScreen(index: widget.index)));
                        }
                      },
                      child: const Text('Давай подарок!')),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
