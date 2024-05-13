import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/ThemeProvider.dart';
import '../utils/Exchange_controller.dart';
import 'NotFoundWidget.dart';
import 'ExchangeDetailPage.dart';
import 'CustomLoadingWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class ExchangeWidget extends StatefulWidget {
  const ExchangeWidget({super.key});

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  ExchangeController exchangeController = Get.put(ExchangeController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (exchangeController.isLoading.value) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomLoadingWidget(loadingText: 'در حال بارگذاری...'),
                      ],
                    ),
                  );
                } else {
                  if (exchangeController.notFound.value) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: NotFoundWidget(),
                    );
                  } else {
                    return themeProvider.isSecondTheme()
                        ? Column(
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(intl.DateFormat.yMd().add_jm().format(exchangeController.exchangesList[0].createdAt)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
                                                        itemCount: exchangeController.exchangesList.length,
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15, // Increased spacing
                                mainAxisSpacing: 15, // Increased spacing
                                                        ),
                                                        itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(15), // Rounded corners
                                    child: InkWell(
                                      onTap: () {
                                        // Navigate to detail page when an item is tapped
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ExchangeDetailPage(
                                              exchange: exchangeController.exchangesList[index]!,
                                              currencyInfo: exchangeController.exchangesList[index].currencyInfo!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      constraints: BoxConstraints(maxWidth: 100),
                                                      child: Text(
                                                        exchangeController.exchangesList[index].currencyInfo?.engName ?? '',
                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
                                                      ),
                                                    ),
                                                    Text(
                                                      exchangeController.exchangesList[index].currencyInfo?.alphabetCode ?? '',
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Image.network(
                                                  exchangeController.exchangesList[index].currencyInfo?.logoUrl ?? '',
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 30),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.end,
                                             children: [
                                               Text(
                                                 exchangeController.exchangesList[index].currentPrice ?? '',
                                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.grey),
                                               ),
                                             ],
                                           ),
                                            SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  exchangeController.exchangesList[index].currentPrice ?? '',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                                                        },
                                                      ),
                              ),
                            ],
                          )

                          : ListView.builder(
                        itemCount: exchangeController.exchangesList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Material(
                            child: InkWell(
                              onTap: () {
                                // Navigate to detail page when an item is tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExchangeDetailPage(
                                      exchange: exchangeController.exchangesList[index]!,
                                      currencyInfo: exchangeController.exchangesList[index].currencyInfo!,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            //icons and names
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                //icon
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 10),
                                                      child: CircleAvatar(
                                                        backgroundImage: CachedNetworkImageProvider(
                                                          exchangeController.exchangesList[index].currencyInfo?.logoUrl ?? '',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //name
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      exchangeController.exchangesList[index].currencyInfo?.persianName ?? '',
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                //current price
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      exchangeController.exchangesList[index].currentPrice ?? '',
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                      height: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
