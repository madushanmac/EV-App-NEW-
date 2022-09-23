
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:app/Charging.dart';


class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  String _data = "null", value = "";
//interface for a scan QR
  Future _incrementCounter() async {
    _data = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "Cancel", true, ScanMode.QR);

    setState(() {
      value = _data;
      if (value == null) {
        value = 'not detected';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR '),
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
                'Press for SCAN',
                style: TextStyle(fontSize: 24, color: Colors.white),
              )),
          Center(child: Text(value)),
          Center(
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.qr_code_scanner_rounded),
              )),
          SizedBox(height: 60),
          Center(
            child: FlatButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Charging()));
              },
              icon: const Icon(Icons.navigate_next),
              label: Text('Go to next page'),
              color: Colors.red,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
