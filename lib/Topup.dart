import 'dart:ffi';

import 'package:flutter/material.dart';

class Topup extends StatefulWidget {
  const Topup({Key? key}) : super(key: key);

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top-Up',
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
                            height: 20,
                          )
                        ],
                      ),
                      const Text(
                        'Add Card',
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assests/boc.png')),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50)),
                          color: Color.fromARGB(255, 174, 136, 30),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('BOC Card Clicked');
                          },
                        ),
                      )
                    ],
                  )),
            ],
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text('Done'),
            color: Colors.redAccent[200],
            icon: const Icon(Icons.done_all),
          )
        ],
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
