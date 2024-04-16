import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/Gold_controller.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:exchange_rate/custom_theme.dart';


class GoldWidget extends StatefulWidget {
  const GoldWidget({super.key});

  @override
  State<GoldWidget> createState() => _GoldWidgetState();
}

class _GoldWidgetState extends State<GoldWidget> {
  GoldController goldController = Get.put(GoldController());


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
                Obx(() => goldController.isLoading.value
                    ?Center(
                  child: CircularProgressIndicator(),
                )
                    :ListView.builder(
                    itemCount: goldController.goldList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(padding: EdgeInsets.only(left: 10,right: 10),
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
                                          //icons and names
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //icon
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(padding: EdgeInsets.only(left: 10)
                                                    ,child: CircleAvatar(
                                                        backgroundImage: NetworkImage(goldController.goldList[index].goldInfo.logoUrl??'',)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //name
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(goldController.goldList[index].goldInfo.name??'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),],
                                              ),
                                            ],
                                              ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //current price
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [Text(goldController.goldList[index].currentPrice,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),)],),
                                            ],
                                          )
                                            ],
                                    ),
                                  )

                              ),
                              Divider(
                                color: Colors.grey[300], // Set the color of the divider
                                height: 1.0, // Set the height of the divider
                              ),
                            ]),);
                    }
                ))
              ],
            ),
          ),
        ),
      ),
    );}}