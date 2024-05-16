import 'package:fitness_ui_kit/colors.dart';
import 'package:fitness_ui_kit/latest_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodayTargetDetailPage extends StatefulWidget {
  const TodayTargetDetailPage({super.key});

  @override
  _TodayTargetDetailPageState createState() => _TodayTargetDetailPageState();
}

class _TodayTargetDetailPageState extends State<TodayTargetDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Icons.arrow_back,
                size: 22,
                color: black.withOpacity(0.3),),
            )),
            Text("Activity Tracker",style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: black
            ),),
            IconButton(onPressed: (){
            },icon: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: black.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(Entypo.dots_two_horizontal,
                size: 22,
                color: black.withOpacity(0.3),),
            ))
          ],
        ),
      ),
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today Target",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17
                        ),),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              secondary,primary
                            ]),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Icon(Icons.add,size: 18,
                            color: white,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Flexible(child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/images/glass.svg"),
                              Text("Water Intake",style: TextStyle(
                                fontSize: 13,
                                color: black
                              ),)
                            ],
                          ),
                        )),
                        SizedBox(width: 20,),
                        Flexible(child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/images/foot_step.svg"),
                              Text("Foot Steps",style: TextStyle(
                                  fontSize: 13,
                                  color: black
                              ),)
                            ],
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Activity Progress",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: black
        ),),
        Container(
          width: 95,
          height: 35,decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              secondary,primary
            ]),
            borderRadius: BorderRadius.circular(20)
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Weekly",style: TextStyle(
                  fontSize: 13,
                  color: white
              ),),
              Icon(Icons.keyboard_arrow_down,color: white,)
            ],
          ),
        )],
        ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                  spreadRadius: 20,
                  blurRadius: 10,
                  color: black.withOpacity(0.01),
                  offset: Offset(0,1)
                )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekly.length, (index) {
                    return Column(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Container(
                                width: 20,
                                height: size.height,
                                decoration: BoxDecoration(
                                  color: bgTextField,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 20,
                                  height: size.height*(weekly[index]['count']),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: weekly[index]['color']),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(weekly[index]['day'],style: TextStyle(
                            fontSize: 13
                        ),)
                      ],
                    );
                  })
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Latest Activity",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: black
                ),),
                Text("See more",style: TextStyle(
                    fontSize: 15,
                    color: black.withOpacity(0.5)
                ),),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: List.generate(latestActivityJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: white.withOpacity(0.01),
                              spreadRadius: 20,
                              blurRadius: 10,
                              offset: Offset(0,1)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(latestActivityJson[index]['img']))
                            ),
                          ),
                          SizedBox(width: 15,),
                          Row(
                            children: [
                              Container(
                                height: 55,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(latestActivityJson[index]['title'],style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text(latestActivityJson[index]['time_ago'],style: TextStyle(
                                        fontSize: 13,
                                        color: black.withOpacity(0.5)
                                    ),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          Icon(Entypo.dots_three_vertical,
                            size: 15,color: black.withOpacity(0.5),)
                        ],),
                    ),
                  ),
                );
              })
            )

      ]),
    ));
  }
}
