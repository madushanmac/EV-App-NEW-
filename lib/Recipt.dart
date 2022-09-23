import 'package:flutter/material.dart';
import 'package:app/home.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';

class Recipt extends StatefulWidget {
  int ChargingPrecentageEstimated;
  int Price;
  int Kwh;

  Recipt({
    Key? key,
    required this.ChargingPrecentageEstimated,
    required this.Price,
    required this.Kwh,
  }) : super(key: key);

  @override
  State<Recipt> createState() => _ReciptState();
}

class _ReciptState extends State<Recipt> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipt'),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 2),
          child: Center(
            child: Column(
              children: [
                Text('Sample Recipt'),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Charge Completed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color.fromARGB(255, 86, 14, 9)),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.battery_saver_rounded,
                      color: Color.fromARGB(255, 119, 20, 7),
                      size: 150,
                    ),
                    Text(
                      '${widget.ChargingPrecentageEstimated} %',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 70.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Used Kwh Capacity',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.white,
                  height: 30.0,
                  width: 100.0,
                  child: Center(
                    child: Text(
                      '${widget.Kwh} kwh',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Total Cost To Charg', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 30.0,
                  width: 100.0,
                  color: Colors.white,
                  child: Text(
                    '${widget.Price} LKR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 25.0),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton.icon(
                      height: 50.0,
                      icon: Icon(Icons.download),
                      onPressed: _createPDF,
                      label: Text('Download'),
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    FlatButton.icon(
                      height: 50.0,
                      minWidth: 125.0,
                      icon: Icon(Icons.done),
                      onPressed: ()async {
                        if(isLoading) return;
                        setState((){
                          isLoading = true;

                        });
                        await Future.delayed(Duration(seconds: 2));
                        setState((){
                          isLoading = false;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },

                      label: Text('Done'),
                      color: Color.fromARGB(255, 117, 17, 21),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[600],
    );
  }

  //create PDF and Print it
  void _createPDF() async {
    final doc = pw.Document();

    DateTime now = new DateTime.now();

    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Text('EV- Charge Recipt', style: pw.TextStyle(fontSize: 30.0)),
            pw.Text('-----------------', style: pw.TextStyle(fontSize: 30.0)),
            pw.SizedBox(height: 190.0),
            pw.Text('Total Cost : ${widget.Price} LKR ',
                style: pw.TextStyle(fontSize: 50.0)),
            pw.SizedBox(
              height: 20.0,
            ),
            pw.Text('Total Kwh Usage : ${widget.Kwh} ',
                style: pw.TextStyle(fontSize: 50.0)),
            pw.Divider(height: 40.0),
            pw.SizedBox(height: 120.0),
            pw.Text('Date and Time $now', style: pw.TextStyle(fontSize: 25.0)),
          ]);
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
} // Recipt class




// void _createPDF() async {
//     final doc = pw.Document();

//     doc.addPage(pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text('$Price ', style: pw.TextStyle(fontSize: 30.0)),
//           );
//         }));
//     await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => doc.save());
//   }