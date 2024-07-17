import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/presentation/colors.dart';
import 'package:personal_expense_tracker/presentation/pages/widgets/amount_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) => const AmountContainer(),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle onPressed
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.category_container_color,
        foregroundColor: AppColors.white,
        elevation: 2.0,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle tap on first item
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle tap on second item
              },
            ),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.circle, color: Colors.white,),
      //         label: '',
      //       ),
      //     ],
      //     selectedItemColor: Colors.blue,
      //   ),
    );
  }
}
