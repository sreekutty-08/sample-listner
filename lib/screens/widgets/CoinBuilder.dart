import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Controller/CoinDataController/CoinController.dart';
import '../../Models/coin_transaction/coin_transaction.dart';
import '../../Models/coin_transaction/datum.dart';

class CoinBuilder extends StatelessWidget {
  String filterKey;
  CoinBuilder({super.key, required this.filterKey});

  @override
  Widget build(BuildContext context) {
    CoinController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FutureBuilder(
          future: controller.fetchTransaction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              CoinTransaction coinTransaction = snapshot.data;
              List<TransactionData> filteredData = coinTransaction.data
                      ?.where(
                          (filterdetail) => filterdetail.remark == filterKey)
                      .toList() ??
                  [];
              return ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> dateTimeParts =
                        filteredData[index].createdOn!.split(" ");
                    return Card(
                      child: ListTile(
                        leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                            )),
                        title: Text(dateTimeParts[0]),
                        subtitle: Text(dateTimeParts[1]),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              filterKey == "Coin Purchased"
                                  ? filteredData[index].coinCredit!
                                  : filteredData[index].coinDebit!,
                              style: filterKey == "Coin Purchased"
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)
                                  : const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                            ),
                            filterKey == "Coin Purchased"? const Text("By Recharge"):const Text('By Call')
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
