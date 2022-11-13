import 'package:bmi/provider/slider_provider.dart';
import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  const GenderBox({
    Key? key,
    required this.name,
    required this.prov,
    required this.kColor,
  }) : super(key: key);
  final String name;
  final SliderProvider prov;
  final Color kColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 210,
        width: 187,
        decoration: BoxDecoration(
          color: kColor,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Icon(
              name == "Male" ? Icons.male_sharp : Icons.female_sharp,
              color: name != "Male" ? Colors.orange[800] : Colors.blue,
              size: 150,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
