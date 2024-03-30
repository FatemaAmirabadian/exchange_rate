import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/crypto_controller.dart';

class CryptoWidget extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 30),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
                  () => controller.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[700]!,
                                              offset: const Offset(4, 4),
                                              blurRadius: 5)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.network(controller
                                          .coinsList[index].image),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.coinsList[index].name
                                    ),
                                    Text(
                                      ' ${controller.coinsList[index].priceChange24H.toStringAsFixed(2)} %',
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$ ${controller.coinsList[index].currentPrice.round()}',
                                ),
                                Text(
                                  controller.coinsList[index].symbol
                                      .toUpperCase(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
