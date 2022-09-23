import 'package:flutter/material.dart';

import 'package:app/home.dart';


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                  height: 500,
                  width: 350,
                  color: Colors.grey[600],
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            height: 220,
                          )
                        ],
                      ),
                      const Text(
                        'Loading...',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ],
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text('Back'),
            color: Colors.redAccent[200],
            icon: const Icon(Icons.back_hand_outlined),
          )
        ],
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
