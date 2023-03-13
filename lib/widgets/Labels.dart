import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({super.key, required this.route, required this.bottomText});

  final String route;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            '¿No tienes cuenta?',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, route),
            child: Text(
              bottomText,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
