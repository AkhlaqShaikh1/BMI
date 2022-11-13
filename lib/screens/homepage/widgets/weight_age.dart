import 'package:flutter/material.dart';

import '../../../provider/slider_provider.dart';

class WeightAgeBox extends StatelessWidget {
  const WeightAgeBox({
    Key? key,
    required this.prov,
    required this.name,
  }) : super(key: key);

  final SliderProvider prov;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 187,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 2, 39, 69),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(children: [
        const SizedBox(height: 20),
        Text(
          name.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          name == "Weight" ? prov.weight.toString() : prov.age.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (name == "Age") {
                  prov.subAge();
                } else {
                  prov.subW();
                }
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.remove),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                if (name == "Age") {
                  prov.addAge();
                } else {
                  prov.addW();
                }
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
