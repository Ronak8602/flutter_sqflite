import 'package:flutter/material.dart';

void main(){
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, child: const Text('Insert')),
              ElevatedButton(onPressed: (){}, child: const Text('Query')),
              ElevatedButton(onPressed: (){}, child: const Text('Update')),
              ElevatedButton(onPressed: (){}, child: const Text('Delete')),
            ],
          ),
        ),
      ),

    );
  }
}

