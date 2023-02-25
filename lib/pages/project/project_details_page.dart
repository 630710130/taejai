import 'package:flutter/material.dart';
import 'package:untitled2/models/project.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var percentText = ((project.receiveAmount/project.targetAmount)*100).toStringAsFixed(0);
    var percent = int.tryParse(percentText);
    var f = NumberFormat('#,###,000');
    var myTextStyle = TextStyle(fontSize: 19, color: Colors.black54);
    var targetTextStyle = TextStyle(fontSize: 20, color: Colors.black87);
    var targetAmountTextstyle = TextStyle(fontSize: 20);
    var percentageTextstyle = TextStyle(fontSize: 20);
    var durationTextStyle = TextStyle(fontSize: 20, color: Colors.black45);
    var donateTextStyle = TextStyle(fontSize: 20, color: Colors.black45);
    var recieveTextStyle = TextStyle(fontSize: 40, color: Colors.orange,fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.title,

          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        project.title,
                        style: TextStyle(fontSize: 30.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Image.asset(project.imageUrl,fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(project.description,overflow: TextOverflow.fade,)),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Text('ระยะเวลาโครงการ : '),
                            Expanded(child: Text(project.dayDuration,overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('พื้นที่ดำเนินโครงการ : '),
                            Expanded(child: Text(project.place,overflow: TextOverflow.fade,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  child:Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('ยอดบริจาคขณะนี้',
                                      style: targetTextStyle ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('${f.format(project.receiveAmount)} บาท',style: recieveTextStyle,),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('เป้าหมาย',
                                      style: targetTextStyle ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${f.format(project.targetAmount)} บาท',
                                      style: targetAmountTextstyle),
                                  Text('$percentText%',
                                      style: percentageTextstyle),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Expanded(flex: percent!,
                                    child: Container(
                                      height: 10.0,
                                      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Expanded(flex: 100-percent!,
                                    child: Container(
                                      height: 10.0,
                                      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
                                      color: Color(0xFFE8E8E8),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'เหลือเวลาอีก ${project.duration.toString()} วัน',
                                      style: durationTextStyle),
                                  Row(
                                    children: [
                                      Icon(Icons.person_outline,size: 25,color: Colors.grey),
                                      Text(' ${project.donateCount} คน',
                                          style: donateTextStyle),
                                    ],
                                  ),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 25.0),
                                      Container(child: ElevatedButton(onPressed: (){}, child: Text('❤ ร่วมบริจาค'),style:ElevatedButton.styleFrom(primary: Colors.redAccent,)),width: 150,height: 40,),
                                      SizedBox(height: 8.0),
                                      Container(child: ElevatedButton(onPressed: (){}, child: Text('🛒 หยิบใส่ตะกร้า'),style:ElevatedButton.styleFrom(primary: Colors.redAccent,)),width: 150,height: 40,),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(decoration: BoxDecoration(border:BorderDirectional(top:BorderSide(width: 1.0, color: Colors.grey), ),),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('แชร์ให้เพื่อน'),
                                                  ],
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Container(child: FloatingActionButton(
                                                        child: FaIcon(FontAwesomeIcons.line),
                                                        backgroundColor: Colors.green,
                                                        foregroundColor: Colors.white,
                                                        onPressed: () {},
                                                      ),),
                                                    ),
                                                    SizedBox(width: 80.0,),
                                                    Container(
                                                      child: Container(child: FloatingActionButton(
                                                        child: FaIcon(FontAwesomeIcons.facebook),
                                                        backgroundColor: Colors.blue,
                                                        foregroundColor: Colors.white,
                                                        onPressed: () {},
                                                      ),),
                                                    ),
                                                    SizedBox(width: 80.0,),
                                                    Container(child: FloatingActionButton(
                                                      child: FaIcon(FontAwesomeIcons.twitter),
                                                      backgroundColor: Colors.lightBlueAccent,
                                                      foregroundColor: Colors.white,
                                                      onPressed: () {},
                                                    ),),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}