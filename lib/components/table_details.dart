import 'package:flutter/material.dart';

class TableHeadder extends StatelessWidget {
  const TableHeadder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      //border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            ColumnTitle(
              title: 'Description',
            ),
            ColumnTitle(
              title: 'Units',
            ),
            ColumnTitle(
              title: 'Amblator',
            ),
            ColumnTitle(
              title: 'Ac',
            ),
          ],
        ),
      ],
    );
  }
}

class TableDetailsRow extends StatelessWidget {
  final String des;
  final String units;
  final String amb;
  final String ac;
  final TextAlign align1;
  final TextAlign align2;
  final TextAlign align3;
  final TextAlign align4;
  const TableDetailsRow({
    Key? key,
    this.des = '',
    this.units = '',
    this.amb = '',
    this.ac = '',
    this.align1 = TextAlign.center,
    this.align2 = TextAlign.center,
    this.align3 = TextAlign.center,
    this.align4 = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        print("click");
      },
      child: Table(
        //border: TableBorder.all(),
        children: [
          TableRow(children: [
            DataCell(data: des, align: align1),
            DataCell(data: units, align: align2),
            DataCell(data: amb, align: align3),
            DataCell(data: ac, align: align4),
          ])
        ],
      ),
    );
  }
}

class DataCell extends StatelessWidget {
  final String data;
  final TextAlign align;
  const DataCell({
    Key? key,
    this.data = '',
    required this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black12,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        data,
        textAlign: align,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

class ColumnTitle extends StatelessWidget {
  final String title;
  const ColumnTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
