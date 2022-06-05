import 'package:flutter/material.dart';
import 'package:rle_compress/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height * 0.15),
              child: const Center(child: FileChoose())),
          Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height * 0.25),
              child: const Center(child: MethodChoose())),
          Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height * 0.15),
              child: const Center(child: Stats())),
          Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height * 0.05),
              child: const Center(child: ErrorTab())),
          Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height * 0.4),
              child: Center(child: History())),
        ],
      ),
    );
  }
}
