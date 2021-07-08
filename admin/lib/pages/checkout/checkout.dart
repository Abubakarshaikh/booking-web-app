import '../../components/MainContainer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../components/Typewriter.dart';
import '../../components/SqureCheckBox.dart';
import 'OrderInformationWidget.dart';
import 'OrderWidget.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: SizedBox(
        width: 1665,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 36),
          child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveGridCol(
                lg: 12,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Training 2021",
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 34.0,
                          color: Color(0xff414141),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "(Capt2021) en Estadio Olimpico Benito Juarez ( 14/06/2021, 00:00 MDT",
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 18.0,
                              color: Color(0xff767F8A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 58),
                            child: Text(
                              "E Password Only",
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 18.0,
                                color: Color(0xffFF4C4C),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: OrderHistoryTableWidget(),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: OrderInformationWidget(),
                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 21, top: 33),
                  child: Text(
                    "Possible Delivery Options For this order: Will Call (\$ 0.00) ",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: OrderWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderHistoryTableWidget extends StatefulWidget {
  const OrderHistoryTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  _OrderHistoryTableWidgetState createState() =>
      _OrderHistoryTableWidgetState();
}

class _OrderHistoryTableWidgetState extends State<OrderHistoryTableWidget> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final dts = DTS();
    int tableItemsCount = dts.rowCount;
    int defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    bool isRowCountLessDefaultRowsPerPage =
        tableItemsCount < defaultRowsPerPage;
    _rowsPerPage =
        isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
    return PaginatedDataTable(
      // columnSpacing: 100,
      // headingRowHeight: 100,
      dataRowHeight: 53,
      columns: [
        DataColumn(
            label: TypeWriter(
          text: "#",
          size: 16,
          weight: FontWeight.w700,
          color: Color(0xff767F8A),
        )),
        DataColumn(
            label: TypeWriter(
                text: "Qty",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "Expire",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "Location",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "Price Type",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "Price",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "C.x Serv.*",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "Partial",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
        DataColumn(
            label: TypeWriter(
                text: "Total Item",
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff767F8A))),
      ],
      source: dts,
      // rowsPerPage: _rowsPerPage!,
      rowsPerPage:
          isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
      onRowsPerPageChanged:
          isRowCountLessDefaultRowsPerPage // The source of problem!
              ? null
              : (rowCount) {
                  setState(() {
                    _rowsPerPage1 = rowCount!;
                  });
                },
    );
  }
}

const titleStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 22.0,
);

const buttonStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        // Text("#ce11$index"),
        TypeWriter(
            text: "1",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        TypeWriter(
            text: "1",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        TypeWriter(
            text: "15:55 CST",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        TypeWriter(
            text:
                "South Head X1-Door 22 and 27 (South Head X1), South Cabcera, 1",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        Row(
          children: [
            TypeWriter(
              text: "Change Group",
              size: 18,
              weight: FontWeight.w400,
              color: Color(0xff1297D6),
            ),
            SizedBox(width: 11),
            TypeWriter(
                text: "Courtesy (Cortesia) \$0",
                size: 18,
                weight: FontWeight.w400,
                color: Color(0xff767F8A)),
          ],
        ),
      ),
      DataCell(
        TypeWriter(
            text: "\$ 0.00",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        TypeWriter(
            text: "\$ 0.00",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        TypeWriter(
            text: "\$ 0.00",
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff767F8A)),
      ),
      DataCell(
        Row(
          children: [
            TypeWriter(
              text: "\$ 0.00",
              size: 18,
              weight: FontWeight.w700,
              color: Color(0xff767F8A),
            ),
            SizedBox(width: 55),
            TypeWriter(
              text: "Order More",
              size: 18,
              weight: FontWeight.w400,
              color: Color(0xff1297D6),
              isUnderline: TextDecoration.underline,
            ),
            SizedBox(width: 22),
            SqureCheckBox(),
          ],
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 2;

  @override
  int get selectedRowCount => 0;
}
