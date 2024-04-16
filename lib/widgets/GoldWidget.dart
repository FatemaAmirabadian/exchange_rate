import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../utils/Gold_controller.dart';
import 'package:persian_fonts/persian_fonts.dart';


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
                                                        backgroundImage: NetworkImage(goldController.goldList[index].logoUrl??'',)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //name
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(goldController.goldList[index].name??'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                                                  Text(goldController.goldList[index].uniqueName??'',style: TextStyle(color:Colors.grey[600],fontWeight: FontWeight.bold),)],
                                              ),
                                            ],
                                              ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //current price
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [Text(goldController.goldList[index].id.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),)],),
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