import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';
import 'package:go_router/go_router.dart';

const List<Map<String, String>> animationMapList = [
  {'lable': 'Mouse Courser', 'routeName': mouseCourser},
  {'lable': 'Flip Animation', 'routeName': flipAnimation},
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(2, constraints.maxWidth ~/ 200),
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            child: InkWell(
              onTap: () {
                context.goNamed(animationMapList[index]['routeName']!);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    animationMapList[index]['lable']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          itemCount: animationMapList.length,
        );
      }),
    );
  }
}
