

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app_flutter/view/check_out/widgets/adress_view.dart';
import 'package:shope_app_flutter/view/check_out/widgets/summary.dart';
import 'package:timelines/timelines.dart';

import '../../constant.dart';
import '../../core/view_model/checkout_view_model.dart';
import '../login/widgets/custom_button.dart';
import 'widgets/delevery_time.dart';

class CheckOutView extends StatelessWidget {
   CheckOutView({Key? key}) : super(key: key);


  final _processes = [
    'Delivery',
    'Address',
    'Summary',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
        init: CheckoutViewModel(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                  onPressed: () {
                    if (controller.index == 0) {
                      Get.back();
                    } else {
                      controller.changeIndex(controller.index - 1);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )),
              title: const Text(
                "Order Status",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    //padding: const EdgeInsets.all(20),
                    child: Timeline.tileBuilder(
                      theme: TimelineThemeData(
                          direction: Axis.horizontal,
                          connectorTheme: const ConnectorThemeData(
                              space: 1.0, thickness: 1.0)),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        itemExtentBuilder: (_, __) =>
                        MediaQuery.of(context).size.width /
                            _processes.length,
                        contentsBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              _processes[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: controller.getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorBuilder: (_, index) {
                          Color color;
                          var child;
                          if (index == controller.index) {
                            color = primaryColor;
                            child = const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                AlwaysStoppedAnimation(Colors.white),
                              ),
                            );
                          } else if (index < controller.index) {
                            color = primaryColor;
                            child = const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 15.0,
                            );
                          } else {
                            color = todoColor;
                          }
                          if (index <= controller.index) {
                            return Stack(
                              children: [
                                CustomPaint(
                                  size: const Size(30.0, 30.0),
                                  painter: _BezierPainter(
                                    color: color,
                                    drawStart: index > 0,
                                    drawEnd: index < controller.index,
                                  ),
                                ),
                                DotIndicator(
                                  size: 30.0,
                                  color: color,
                                  child: child,
                                ),
                              ],
                            );
                          } else {
                            return Stack(
                              children: [
                                CustomPaint(
                                  size: const Size(15.0, 15.0),
                                  painter: _BezierPainter(
                                    color: color,
                                    drawEnd: index < _processes.length - 1,
                                  ),
                                ),
                                OutlinedDotIndicator(
                                  borderWidth: 4.0,
                                  color: color,
                                ),
                              ],
                            );
                          }
                        },
                        connectorBuilder: (_, index, type) {
                          if (index > 0) {
                            if (index == controller.index) {
                              final prevColor = controller.getColor(index - 1);
                              final color = controller.getColor(index);
                              List<Color> gradientColors;
                              if (type == ConnectorType.start) {
                                gradientColors = [primaryColor, color];
                              } else {
                                gradientColors = [
                                  prevColor,
                                  Color.lerp(prevColor, color, 1)!
                                ];
                              }
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                ),
                              );
                            } else {
                              return SolidLineConnector(
                                color: controller.getColor(index),
                              );
                            }
                          } else {
                            return null;
                          }
                        },
                        itemCount: _processes.length,
                      ),
                    ),
                  ),
                  controller.pages == Pages.deliveryTime
                      ? const DeliveryTime()
                      : controller.pages == Pages.addAddress
                      ? const AdressView()
                      :  Summary(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: CustomButton(
                      text: "Next",
                      onPress: () {
                        controller.changeIndex(controller.index + 1);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;


  @override
  void paint(Canvas canvas, Size size) {


    }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
