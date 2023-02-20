import 'package:flutter/material.dart';

class HeaderYao extends StatelessWidget {
  const HeaderYao({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1557053910-d9eadeed1c58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
              ),
              SizedBox(
                width: 19.0,
              ),
              Text(
                'Selamat Bertaktifitas,\nDeswita',
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    height: 1.0),
              )
            ],
          ),
          Image.asset(
            'assets/images/bell.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
