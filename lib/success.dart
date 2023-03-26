import 'package:birthday/riddle.dart';
import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';

import 'description.dart';

class SuccessScreen extends StatelessWidget {
  final int index;
  static final List<String> imgs = [
    "success1.png",
    "success2.png",
    "success3.png",
    "success4.png",
    "success5.png"
  ];

  const SuccessScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AssetImage successImage = AssetImage(imgs[index]);
    return GestureDetector(
        onTap: () {
          if (index < 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RiddleScreen(index: index + 1)));
          }
        },
        child: Scaffold(body: getMainContainer(context, successImage)));
  }

  Widget getMainContainer(BuildContext context, ImageProvider imageProvider) {
    double width = MediaQuery.of(context).size.width * 0.95;
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('confety.png'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white24.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
            if (index == 4)
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white24.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Text(
                  "Поздравляю ты все отгадала\nБыстрее беги за подарком!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
          ],
        ));
  }
}
