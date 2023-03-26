import 'package:birthday/riddle.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('login-background.png'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Container(
                width: width * 0.8,
                height: width,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Теперь я уверен, что это именниница.\n'
                      'С Днем рождения! Пусть в этот день сбудуться все твои мечты!\n'
                      'Кстати одна из них близка к осущетвлению.\n'
                      'Для этого тебе нужно отгадать зададки, которые приведут тебя к подарку.\n'
                      'Можно следовать по пути отгадок или сначала отгадать все.',
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RiddleScreen(index: 0)));
                        },
                        child: const Text('Начнем'))
                  ],
                ),
              ),
            )));
  }
}
