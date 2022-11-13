import 'package:bmi/screens/homepage/widgets/height_box.dart';
import 'package:bmi/screens/homepage/widgets/weight_age.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi/provider/slider_provider.dart';

import 'widgets/gender_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<SliderProvider>();
    bool sGender = true;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          prov.updateGender(true);
                          sGender = true;
                        },
                        child: GenderBox(
                            name: "Male",
                            prov: prov,
                            kColor: sGender == prov.isMale
                                ? prov.selectedColor
                                : prov.unselectedColor),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          sGender = false;
                          prov.updateGender(false);
                        },
                        child: GenderBox(
                          name: "Female",
                          prov: prov,
                          kColor: sGender != prov.isMale
                              ? prov.selectedColor
                              : prov.unselectedColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            HeightBox(prov: prov),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  WeightAgeBox(prov: prov, name: "Weight"),
                  const SizedBox(width: 8),
                  WeightAgeBox(prov: prov, name: "Age"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                prov.calculateBMI();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("BMI"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text("BMI: ${prov.bmi.toStringAsFixed(1)}"),
                          Text("Age: ${prov.age}"),
                          Text("Gender : ${prov.isMale ? "Male" : "Female"}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.yellow[800],
                height: 70,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
