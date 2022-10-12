import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/widgets/CustomLoader.dart';
class customTableView extends StatefulWidget {
   customTableView({Key? key}) : super(key: key);

  @override
  State<customTableView> createState() => _customTableViewState();
}

class _customTableViewState extends State<customTableView>{


  final List<Map> _books = [
    {
      'id': 100,
      'title': 'Flutter Basics',
      'author': 'David John',
      'department': 'Flutter',
      'Head': 'Someone',
      'description': 'A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog.',
      'Date': '02-20-2020'
    },
    {
      'id': 101,
      'title': 'Flutter Intermediate',
      'author': 'David John',
      'department': 'React',
      'Head': 'Someone',
      'description': 'A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog.',
      'Date': '02-20-2020'
    },
    {
      'id': 102,
      'title': 'Flutter Advance',
      'author': 'David John',
      'department': 'Laravel',
      'Head': 'Someone',
      'description': 'A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog.',
      'Date': '02-20-2020'
    },

  ];
  final _dataTableController = Get.put(Controller());
  late CustomLoader _loader;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loader = CustomLoader();

  }

  @override
  Widget build(BuildContext context) {
    final textValue = Get.arguments.toString();


    return Scaffold(
      appBar: AppBar(title: Text(textValue),),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('PR Notification',style: Theme.of(context).textTheme.subtitle2),
                IconButton(onPressed: (){
                  _loader.showLoader(context);
                  _dataTableController.showHead.value = !_dataTableController.showHead.value;
                  _loader.hideLoader();
                }, icon: Obx(()=>Icon(_dataTableController.showHead.value ?Icons.arrow_upward :Icons.arrow_downward , size: 16,))
                )
              ],
            ),
            Obx(()=> _dataTableController.showHead.value == true ? SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Column(
                 children: [
                   Image.network(
                     'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                     width: 280.0,
                   ),
                  Padding(
                     padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                     child: _createDataTable(),
                   ),
                 ],
               )) : const SizedBox(),),


            // Obx(() => _dataTableController.showHead.value == true? SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: DataTable(
            //     showBottomBorder: true,
            //     dataRowColor: MaterialStateProperty.all(Colors.white),
            //     headingRowColor: MaterialStateProperty.all(Colors.black),
            //     headingRowHeight: 30.0,
            //     dataRowHeight: 20.0,
            //     decoration: const BoxDecoration(
            //       color: Colors.grey,
            //     ),
            //     sortColumnIndex: 0,
            //     sortAscending: true,
            //     headingTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
            //     dataTextStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            //
            //     columns: const <DataColumn>[
            //       DataColumn(
            //         label: Text(
            //           'Name',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //       DataColumn(
            //         label: Text(
            //           'Age',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //       DataColumn(
            //         label: Text(
            //           'Role',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //       DataColumn(
            //         label: Text(
            //           'Date',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //       DataColumn(
            //         label: Text(
            //           'Authority',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //       DataColumn(
            //         label: Text(
            //           'Date',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //       DataColumn(
            //         label: Text(
            //           'Description',
            //           style: TextStyle(fontStyle: FontStyle.italic),
            //         ),
            //       ),
            //     ],
            //     rows: const <DataRow>[
            //       DataRow(
            //         cells: <DataCell>[
            //           DataCell(Text('Ravi')),
            //           DataCell(Text('19')),
            //           DataCell(Text('Student')),
            //           DataCell(Text('08-10-2020')),
            //           DataCell(Text('Null')),
            //           DataCell(Text('02-03-2020')),
            //           DataCell(Text('A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. ', )),
            //         ],
            //       ),
            //       DataRow(
            //         cells: <DataCell>[
            //           DataCell(Text('Jane')),
            //           DataCell(Text('43')),
            //           DataCell(Text('Professor')),
            //           DataCell(Text('08-10-2020')),
            //           DataCell(Text('Null')),
            //           DataCell(Text('02-03-2020')),
            //           DataCell(Text('A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. ')),
            //
            //         ],
            //       ),
            //       DataRow(
            //         cells: <DataCell>[
            //           DataCell(Text('William')),
            //           DataCell(Text('27')),
            //           DataCell(Text('Professor')),
            //           DataCell(Text('08-10-2020')),
            //           DataCell(Text('Null')),
            //           DataCell(Text('02-03-2020')),
            //           DataCell(Text('A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. ')),
            //
            //         ],
            //       ),
            //     ],
            //   )
            // ):const SizedBox(),),
            const SizedBox(height: 10.0,),
            Text('PR Lines',style: Theme.of(context).textTheme.subtitle2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showBottomBorder: true,
                dataRowColor: MaterialStateProperty.all(Colors.white),
                headingRowColor: MaterialStateProperty.all(Colors.black),
                headingRowHeight: 30.0,
                dataRowHeight: 20.0,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                sortColumnIndex: 0,
                sortAscending: true,
                headingTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
                dataTextStyle: const TextStyle(color: Colors.grey, fontSize: 12),

                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Age',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Role',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Authority',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Description',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Ravi')),
                      DataCell(Text('19')),
                      DataCell(Text('Student')),
                      DataCell(Text('08-10-2020')),
                      DataCell(Text('Null')),
                      DataCell(Text('02-03-2020')),
                      DataCell(Text('A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. ')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Jane')),
                      DataCell(Text('43')),
                      DataCell(Text('Professor')),
                      DataCell(Text('08-10-2020')),
                      DataCell(Text('Null')),
                      DataCell(Text('02-03-2020')),
                      DataCell(Text('A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. ')),

                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('27')),
                      DataCell(Text('Professor')),
                      DataCell(Text('08-10-2020')),
                      DataCell(Text('Null')),
                      DataCell(Text('02-03-2020')),
                      DataCell(Text('A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. ')),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  DataTable _createDataTable() {
    return DataTable(

        showBottomBorder: true,
        dataRowColor: MaterialStateProperty.all(Colors.white),
        headingRowColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        headingRowHeight: 30.0,
        dataRowHeight: 20.0,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        sortColumnIndex: 0,
        sortAscending: true,
        headingTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        dataTextStyle: const TextStyle(color: Colors.grey, fontSize: 12),

        columns: _createColumns(), rows: _createRows());
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Book')),
      DataColumn(label: Text('Author')),
      DataColumn(label: Text('department')),
      DataColumn(label: Text('Head')),
      DataColumn(label: Text('description')),
      DataColumn(label: Text('Date')),

    ];
  }
  List<DataRow> _createRows() {
    return _books.map((book) => DataRow(
        cells: [
          DataCell(Text('#' + book['id'].toString())),
          DataCell(Text(book['title'])),
          DataCell(Text(book['author'])),
          DataCell(Text(book['department'])),
          DataCell(Text(book['Head'])),
          DataCell(Text(book['description'])),
          DataCell(Text(book['Date'])),
    ]
    ))
        .toList();
  }
}
