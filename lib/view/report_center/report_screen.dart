import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_control_app/widget/report_cart.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Adjust length based on the number of tabs
    // Add listener to detect tab changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print("Selected tab: ${_tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text("Stock"),
          SizedBox(height: 5,),
          // Add the TabBar here
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: "Overview"),
                Tab(text: "Details"),
                Tab(text: "Report"),
              ],
            ),
          ),
          // Add the TabBarView below it
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  //Index Overview
                  Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Overview Content",style: TextStyle(color: Colors.red),),
                      CardOverviewMenu(),
                      ContainerList(),
                    ],
                  )),
                  //Index Details
                  Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Details Content",style: TextStyle(color: Colors.red),),
                      CardContainerMenu(),
                      Text("Details List",style: TextStyle(color: Colors.red),),
                      CardContainerDetail(),
                      SizedBox(height: 10,),
                      CardContainerDetail(),
                      SizedBox(height: 10,),
                      CardContainerDetail()
                    ],
                  )),
                  //Index Report
                  Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Report",style: TextStyle(color: Colors.red),),
                      CardContainerMenu(),
                      SizedBox(height: 2,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                             //decoration: buildBoxDecoration10(),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: IgnorePointer(
                                      child: TextField(
                                        style:  TextStyle(
                                          fontSize: 16.sp,
                                        ),
                                        decoration: InputDecoration(
                                          // hintText: labelText,
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(27.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.calendar_today,color: Colors.red,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text("Report List",style: TextStyle(color: Colors.red),),
                      // ReportCard(),
                      // ReportCard(),
                      SizedBox(height: 10,),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget CardOverviewMenu() {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3), // Shadow position
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.dehaze_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Stock Manager",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  //labelText: 'Search',
                  hintText: 'Find stocks by name',
                  //helperText: 'Find stocks by name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            // Add widgets here as needed
          ],
        ),
      ],
    ),
  );
}

Widget ContainerList(){
  return Container(
    height: 250,
    width: double.infinity,
    //color: Colors.red,
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: DataTable(
            columns: [
              DataColumn(label: Text(
                  'ID',
                  style: TextStyle( fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'Name',
                  style: TextStyle(  fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'QTY',
                  style: TextStyle(  fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'Price',
                  style: TextStyle(  fontWeight: FontWeight.bold)
              )),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Stephen')),
                DataCell(Text('14')),
                DataCell(Text('33')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('John')),
                DataCell(Text('14')),
                DataCell(Text('33')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('John')),
                DataCell(Text('14')),
                DataCell(Text('33')),
              ]),

            ],
          ),
        ),
       Text("Sub Total: 4455")
      ],
    ),
  );
}

Widget CardContainerMenu(){
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      children: [
      //  Text("Report"),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
             child: Container(
               decoration: BoxDecoration(
                   color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 2,
                     blurRadius: 5,
                     offset: Offset(0, 3), // changes position of shadow
                   ),
                 ],
               ),
               height: 100,
               child: Row(
                 children: [
                   Expanded(child: Icon(Icons.account_balance_wallet_outlined,size: 40,color: Colors.red)),
                   Expanded(
                     child: Text(
                       "300/\$",
                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.red),
                     ),
                   )
                 ],
               ),
             ),
           ),
           SizedBox(width: 10,),
           Expanded(
             child: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 2,
                     blurRadius: 5,
                     offset: Offset(0, 3), // changes position of shadow
                   ),
                 ],
               ),
               height: 100,
               child: Row(
                 children: [
                   Expanded(child: Icon(Icons.production_quantity_limits_rounded,size: 40,color: Colors.red)),
                   Expanded(
                     child: Text(
                       "300 PC",
                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.red),
                     ),
                   )
                 ],
               ),
             ),
           ),
         ],
       ),
        SizedBox(height: 5,),
      ],
    ),
  );
}

Widget CardContainerDetail(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
         ),
        ]
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.card_giftcard_rounded,size: 40,),
          Text("CARD OF PRODUCT"),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
    ),
  );
}




class PopupContainer extends StatefulWidget {
  const PopupContainer({Key? key}) : super(key: key);

  @override
  _PopupContainerState createState() => _PopupContainerState();
}

class _PopupContainerState extends State<PopupContainer> {
  bool clickPopup = true;

  void togglePopup() {
    setState(() {
      clickPopup = !clickPopup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Hello"),
          Text("Hello"),
          Text("Hello"),
          ElevatedButton(
            onPressed: togglePopup,
            child: Text(clickPopup ? "Hide Popup" : "Show Popup"),
          ),
          if (clickPopup)
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: Text("This is the popup content"),
            ),
        ],
      ),
    );
  }
}