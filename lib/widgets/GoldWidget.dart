import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/Gold_controller.dart';
import 'CustomLoadingWidget.dart';
import 'GoldDetailPage.dart';
import 'NotFoundWidget.dart';
import '../providers/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class GoldWidget extends StatefulWidget {
  const GoldWidget({Key? key}) : super(key: key);

  @override
  State<GoldWidget> createState() => _GoldWidgetState();
}

class _GoldWidgetState extends State<GoldWidget> {
  GoldController goldController = Get.put(GoldController());

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
                if (goldController.isLoading.value) {
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
                  if (goldController.notFound.value) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: NotFoundWidget(),
                    );
                  } else {
                    return themeProvider.isSecondTheme()
                        ? ListView.builder(
                      itemCount: goldController.goldList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GoldDetailPage(
                                    goldInfo: goldController.goldList[index].goldInfo!,
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: CircleAvatar(
                                                      backgroundImage: CachedNetworkImageProvider(
                                                        goldController.goldList[index].goldInfo?.logoUrl ?? '',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    goldController.goldList[index].goldInfo?.name ?? '',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    goldController.goldList[index].currentPrice ?? '',
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
                    )
                        : Column(
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    intl.DateFormat.yMd().add_jm().format(goldController.goldList[0].createdAt.toLocal()),
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
                            itemCount: goldController.goldList.length,
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
                                          builder: (context) => GoldDetailPage(
                                            goldInfo: goldController.goldList[index].goldInfo!,
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
                                                      goldController.goldList[index].goldInfo?.name ?? '',
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Image(
                                                image:
                                              CachedNetworkImageProvider(
                                                goldController.goldList[index].goldInfo?.logoUrl ?? ''),
                                              width: 25,
                                              height: 25,)
                                            ],
                                          ),
                                          SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                goldController.goldList[index].currentPrice ?? '',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                goldController.goldList[index].currentPrice ?? '',
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
