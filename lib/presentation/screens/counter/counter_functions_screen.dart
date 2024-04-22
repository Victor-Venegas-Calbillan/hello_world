import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ] 
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', 
              style: const TextStyle( fontSize: 140, fontWeight: FontWeight.w100 )
            ),
            Text(clickCounter == 1 ? 'Click' : 'Clicks', 
              style: const TextStyle( fontSize: 25 )
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonFBA(
            icon: Icons.plus_one, 
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            }
          ),
          const SizedBox(height: 10),
          CustomButtonFBA(
            icon: Icons.exposure_minus_1_outlined, 
            onPressed: (){
              if ( clickCounter <= 0) return;
              setState(() {
                clickCounter--;
              });
            }
          ),
          const SizedBox(height: 10),
          CustomButtonFBA(
            icon: Icons.refresh_outlined,
            onPressed: (){
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButtonFBA extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButtonFBA({
    super.key, 
    required this.icon, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      enableFeedback: true,
      child: Icon(icon),
    );
  }
}
