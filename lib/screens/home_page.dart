import 'package:flutter/material.dart';
import 'package:rle_compress/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Expanded>[
          Expanded(flex: 2, child: Center(child: FileChoose())),
          Expanded(flex: 3, child: Center(child: Text('JUST 2'))),
          Expanded(flex: 2, child: Center(child: Text('JUST 3'))),
          Expanded(flex: 3, child: Center(child: Text('JUST 4'))),
        ],
      ),
    );
  }
}
