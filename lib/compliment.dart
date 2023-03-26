import 'package:flutter/material.dart';

import 'description.dart';

class ComplimentScreen extends StatelessWidget {
  static final List compliments = [
    [
      'login-background.png',
      'complement1.png',
      "Самая восхитительная девушка на свете?"
    ],
    ['login-background.png', 'complement2.png', "Самая любящая и заботливая!"],
    [
      'login-background.png',
      'complement3.png',
      "Прекрасней тебя нет в свете белом!"
    ]
  ];

  const ComplimentScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(compliments[index][0]), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            width: width * 0.8,
            height: width * 1.2,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Column(
              // TODO Проверить может поставить center
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(compliments[index][1]),
                  width: width * 0.6,
                ),
                Text(compliments[index][2]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Widget nextScreen;
                          if (index >= 2) {
                            nextScreen = const DescriptionScreen();
                          } else {
                            nextScreen = ComplimentScreen(index: index + 1);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => nextScreen));
                        },
                        child: Text('Это я!')),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Этот ответ не принимается'),
                        ));
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: const Text('Нет'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
