import 'package:flutter/material.dart';

import '../../../provider/slider_provider.dart';

class HeightBox extends StatelessWidget {
  const HeightBox({
    Key? key,
    required this.prov,
  }) : super(key: key);

  final SliderProvider prov;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 2, 39, 69),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        const SizedBox(height: 20),
        const Text(
          "HEIGHT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          prov.height.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
        ),
        Slider(
          value: prov.height,
          min: 0,
          max: 300,
          divisions: 300,
          activeColor: Colors.orange,
          inactiveColor: Colors.black,
          onChanged: (value) {
            prov.updateHeight(value);
          },
        ),
      ]),
    );
  }
}
