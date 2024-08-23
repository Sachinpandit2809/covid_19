import 'package:flutter/material.dart';

class ReUsableRow extends StatelessWidget {
  final String title, data;
  const ReUsableRow({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(data),
            ],
          ),
          const Divider(),
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}
//test commit 
