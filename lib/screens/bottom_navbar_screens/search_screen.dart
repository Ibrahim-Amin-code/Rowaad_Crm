import 'package:crm_app/componnent/component.dart';
import 'package:flutter/material.dart';
import '../../search_class.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text(' البحث', style: TextStyle(
              fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            // onTap: ()=> scafolldKey.currentState!.openDrawer(),
            child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
        actions: [
          Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("عن ماذا تبحث",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1,
                    fontFamily: 'Cairo',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 16),
                child: InkWell(
                  onTap: ()=> showSearch(context: context, delegate: ProjectUnitSearch()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      Text("بحث المشروعات",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1,
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              myDivider(1),
              Padding(
                padding: EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 16),
                child: InkWell(
                  onTap: ()=> showSearch(context: context, delegate: ProjectUnitSearch()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      Text("بحث العملاء",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1,
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              myDivider(1),
            ],
          ),
        ),
      ),
    );
  }
}

