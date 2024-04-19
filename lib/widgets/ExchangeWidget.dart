import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/Exchange_controller.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'NotFoundWidget.dart';
import 'ExchangeDetailPage.dart';
import 'CustomLoadingWidget.dart';

class ExchangeWidget extends StatefulWidget {
  const ExchangeWidget({super.key});

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  ExchangeController exchangeController = Get.put(ExchangeController());


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: PersianFonts.vazirTextTheme,
      ),
      home: Directionality(
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
                          width:MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:MainAxisAlignment.center,
                              children:[ CustomLoadingWidget(loadingText: 'Loading...')]));
                    } else {
                      if (exchangeController.notFound.value) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: NotFoundWidget(),);
                      } else {
                        return ListView.builder(
                              itemCount: exchangeController.exchangesList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to detail page when an item is tapped
                                    if (exchangeController.exchangesList[index].currencyInfo != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ExchangeDetailPage(
                                            exchange:exchangeController.exchangesList[index]!,
                                            currencyInfo: exchangeController.exchangesList[index].currencyInfo!,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Padding(padding: EdgeInsets.only(left: 10,right: 10),
                                    child: Column(
                                        children:[
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              height: 70,
                                              child:
                                              Container(
                                                padding: const EdgeInsets.all(5),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      //icons
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          //icon
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Padding(padding: EdgeInsets.only(left: 10)
                                                                ,child: CircleAvatar(
                                                                    backgroundImage: NetworkImage(exchangeController.exchangesList[index].currencyInfo?.logoUrl??'',)
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          //name
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(exchangeController.exchangesList[index].currencyInfo?.persianName??'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                                                              Text(exchangeController.exchangesList[index].currencyInfo?.alphabetCode??'',style: TextStyle(color:Colors.grey[600],fontWeight: FontWeight.bold),)],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          //percent change
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text('${exchangeController.exchangesList[index].maxPrice}',style: TextStyle(color: Colors.green),),
                                                                  Text('${exchangeController.exchangesList[index].minPrice}',style: TextStyle(color: Colors.red),),
                                                                ],
                                                              ),
                                                            ],
                                                          ),

                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          //current price
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [Text(exchangeController.exchangesList[index].currentPrice,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),)],
                                                          ),
                                                        ],
                                                      )
                                                    ]
                                                ),
                                              )

                                          ),
                                          Divider(
                                            color: Colors.grey[300], // Set the color of the divider
                                            height: 1.0, // Set the height of the divider
                                          ),
                                        ]),),
                                );
                              }
                          );
                      }
                    }
                  }),
                ],
              ),
            ),
        ),
      ),
    );}}

