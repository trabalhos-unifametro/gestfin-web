import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class TableSimple extends StatefulWidget {
  final List<Widget>? wHeaders;
  final List<String>? sHeaders;
  final List<List<Widget>>? wItems;
  final List<Map<dynamic, dynamic>>? sItems;

  const TableSimple({
    super.key,
    this.wHeaders,
    this.sHeaders,
    this.wItems,
    this.sItems
  });

  @override
  State<TableSimple> createState() => _TableSimpleState();
}

class _TableSimpleState extends State<TableSimple> {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        tHead(),
        ...tBody()
      ],
    );
  }

  TableRow baseLine(List<Widget> list, Color backgroundColor) {
    return TableRow(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        children: list
    );
  }

  TableRow tHead() {
    List<Widget> columnsHeader = [];

    if (widget.sHeaders!.isNotEmpty) {
      for (int i = 0; i < widget.sHeaders!.length; i++) {
        columnsHeader.add(Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(widget.sHeaders![i],
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteSmoke,
              textStyle: const TextStyle(overflow: TextOverflow.ellipsis)
            ),
          ),
        ));
      }
    } else if (widget.wHeaders!.isNotEmpty) {
      for (int i = 0; i < widget.wHeaders!.length; i++) {
        columnsHeader.add(widget.wHeaders![i]);
      }
    }

    return baseLine(columnsHeader, AppColors.primary);
  }

  List<TableRow> tBody() {
    if (widget.sItems != null) {
      return tRowString(widget.sItems!);
    } else if (widget.wItems != null) {
      return tRowWidget(widget.wItems!);
    }
    return [];
  }

  List<TableRow> tRowString(List<Map<dynamic, dynamic>> list) {
    List<TableRow> rows = [];

    for(int i = 0; i < list.length; i++) {
      List<Widget> row = [];
      for (final key in list[i].keys) {
        row.add(Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text('${list[i][key]}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              textStyle: const TextStyle(overflow: TextOverflow.ellipsis)
            ),
          ),
        ));
      }
      rows.add(TableRow(children: row));
    }

    return rows;
  }

  List<TableRow> tRowWidget(List<List<Widget>> list) {
    List<TableRow> rows = [];

    for(int i = 0; i < list.length; i++) {
      List<Widget> row = [];
      for (final item in list[i]) {
        row.add(Container(
          color: Colors.white,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: item,
        ));
      }
      rows.add(baseLine(row, Colors.transparent));
    }

    return rows;
  }
}