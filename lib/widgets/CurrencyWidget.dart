import 'package:flutter/material.dart';
import '../utils/currency_controller.dart';
import 'package:get/get.dart';

class CurrencyWidget extends StatefulWidget {
  const CurrencyWidget({super.key});


  @override
  State<CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  final CurrencyController controller = Get.put(CurrencyController());

  @override
  Widget build(BuildContext context) {

    return Scaffold( body: Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 30),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => controller.isLoading.value
              ? const Center(
                child: CircularProgressIndicator(),
              )
              : ListView.builder(
                itemCount: controller.currencyList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    // child:
                                    // Image.network(controller
                                    //     .currencyList[index].image),
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
                                      controller.currencyList[index].name
                                  ),
                                  Text(
                                    ' ${double.parse(controller.currencyList[index].priceChange)} %',
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
                                '\$ ${controller.currencyList[index].currentPrice}',
                              ),
                              // Text(
                              //   controller.currencyList[index].symbol
                              //       .toUpperCase(),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
