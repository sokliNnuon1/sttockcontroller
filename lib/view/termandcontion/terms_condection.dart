import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({super.key});

  @override
  State<TermConditionScreen> createState() => _TermConditionScreenState();
}

class _TermConditionScreenState extends State<TermConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        title: Text('Terms Conditions'),
      ),
      body: Column(
        children: [
          Text('Term & Conditions'),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}