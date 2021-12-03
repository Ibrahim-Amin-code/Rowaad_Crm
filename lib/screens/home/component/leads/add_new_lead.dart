// import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components.dart';
import 'controller/api_add_client.dart';
import 'controller/api_genral_info.dart';

class AddLead extends StatefulWidget {

  @override
  _AddLeadState createState() => _AddLeadState();

}

class _AddLeadState extends State<AddLead> {
  var formKey = GlobalKey<FormState>();

   TextEditingController name = TextEditingController();

   TextEditingController phoneNum = TextEditingController();

   TextEditingController otherPhoneNum = TextEditingController();

   TextEditingController whatsAppPhoneNum = TextEditingController();

   TextEditingController jobTitle = TextEditingController();

   TextEditingController adderss = TextEditingController();

   TextEditingController email = TextEditingController();


  var _list = [];
  var _list2 = [];
  var _list3 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text('اضافة عميل جديد',
              style: TextStyle(
                  fontSize: 14,fontFamily: 'Cairo' ,fontWeight: FontWeight.bold,color: Colors.black
              ),),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor:Colors.white,
      ),
      body: FutureBuilder(
         future: getGeneralInfo(),
    builder: (context, AsyncSnapshot snapshot)
    {
      if (snapshot.hasData) {

        Map d = snapshot.data['ClientClassList'];
        d.forEach((key, value) {
          _list.add(value);
        });

        Map s = snapshot.data['ClientStatusList'];
        s.forEach((key, value) {
          _list2.add(value);
        });

        Map r = snapshot.data['ClientRefferalList'];
        r.forEach((key, value) {
          _list3.add(value);
        });

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.9,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              children: [
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("اضافة عميل جديد", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Text("الاسم *", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 2,
                        ),
                        leadTextfield(type: TextInputType.text,
                          controller: name,
                          height: 50,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("رقم الهاتف *", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 2,
                        ),
                        leadTextfield(type: TextInputType.phone,
                          controller: phoneNum,
                          height: 50,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("رقم الوتس أب *", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 2,
                        ),
                        leadTextfield(type: TextInputType.phone,
                            controller: whatsAppPhoneNum,
                            height: 50),
                        SizedBox(
                          height: 10,
                        ),
                        Text("رقم هاتف اخر ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 5,
                        ),
                        leadTextfield(type: TextInputType.phone,
                          controller: otherPhoneNum,
                          height: 50,),
                        Text("المسمى الوظيفي", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 5,
                        ),
                        leadTextfield(type: TextInputType.text,
                          controller: jobTitle,
                          height: 50,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("العنوان ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 2,
                        ),
                        leadTextfield(type: TextInputType.streetAddress,
                          controller: adderss,
                          height: 50,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("البريد الإلكتروني ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        SizedBox(
                          height: 2,
                        ),
                        leadTextfield(type: TextInputType.emailAddress,
                          controller: email,
                          height: 50,),
                        SizedBox(height: 10),
                        BlocConsumer<AppCubit, AppStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text('فئة العميل', style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () => AppCubit.get(context).changeShowMenu(),
                                      child: Container(
                                        padding:
                                        EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: HexColor('#E6E6E6'),
                                            borderRadius: BorderRadius.circular(10)),
                                        // margin: EdgeInsets.symmetric(vertical: 10),
                                        height: 50,
                                        width: 170,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(AppCubit.get(context).textMenu.toString(),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Icon(Icons.keyboard_arrow_down_outlined,),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(visible: AppCubit.get(context).showMenu,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18, right: 80),
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Container(
                                            height: 80,
                                            width: 130,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(0, 1),
                                                      spreadRadius: 1
                                                  ),
                                                ]
                                            ),
                                            child: ListView.separated(
                                                padding: EdgeInsets.only(
                                                    left: 10, top: 10),
                                                itemBuilder: (context, index) =>
                                                    InkWell(
                                                        onTap: () {
                                                          AppCubit.get(context).changeTextMenu(
                                                              val: _list[index].toString());
                                                          AppCubit.get(context).changeShowMenu();
                                                          // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                                          // List<Weight> weightData =
                                                          //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                                        },
                                                        child: Text(
                                                            _list[index])),
                                                separatorBuilder: (context, index) =>
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                //snapshot.data['ClientClassList']
                                                itemCount: snapshot.data['ClientClassList'].length),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text('حالة العميل', style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () => AppCubit.get(context)
                                          .changeShowMenu1(),
                                      child: Container(
                                        padding:
                                        EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                            color: HexColor('#E6E6E6'),
                                            borderRadius: BorderRadius.circular(
                                                10)),
                                        // margin: EdgeInsets.symmetric(vertical: 10),
                                        height: 50,
                                        width: 170,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(AppCubit
                                                .get(context)
                                                .textMenu1
                                                .toString(),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Icon(Icons
                                                .keyboard_arrow_down_outlined,),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: AppCubit
                                          .get(context)
                                          .showMenu1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18, right: 80),
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Container(
                                              height: 80,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(0, 1),
                                                        spreadRadius: 1
                                                    ),
                                                  ]
                                              ),
                                              // color: Colors.red,
                                              child: ListView.separated(
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  itemBuilder: (context,
                                                      index) =>
                                                      InkWell(
                                                          onTap: () {
                                                            // print('ggg ${_list[0]}');
                                                            AppCubit.get(
                                                                context)
                                                                .changeTextMenu1(
                                                                val: _list2[index]
                                                                    .toString());
                                                            AppCubit.get(
                                                                context)
                                                                .changeShowMenu1();
                                                            // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                                            // List<Weight> weightData =
                                                            //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                                          },
                                                          child: Text(
                                                              _list2[index])),
                                                  separatorBuilder: (context,
                                                      index) =>
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                  itemCount: snapshot
                                                      .data['ClientStatusList']
                                                      .length)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text('مصدر العميل', style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () => AppCubit.get(context)
                                          .changeShowMenu2(),
                                      child: Container(
                                        padding:
                                        EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                            color: HexColor('#E6E6E6'),
                                            borderRadius: BorderRadius.circular(
                                                10)),
                                        // margin: EdgeInsets.symmetric(vertical: 10),
                                        height: 50,
                                        width: 170,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(AppCubit
                                                .get(context)
                                                .textMenu2
                                                .toString(),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Icon(Icons
                                                .keyboard_arrow_down_outlined,),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: AppCubit
                                          .get(context)
                                          .showMenu2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18, right: 80),
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Container(
                                            height: 80,
                                            width: 130,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(0, 1),
                                                      spreadRadius: 1
                                                  ),
                                                ]
                                            ),
                                            child: ListView.separated(
                                                padding: EdgeInsets.only(
                                                    left: 10, top: 10),
                                                itemBuilder: (context, index) =>
                                                    InkWell(
                                                        onTap: () {
                                                          // print('ggg ${_list[0]}');
                                                          AppCubit.get(context).changeTextMenu2(
                                                              val: _list3[index].toString());
                                                          AppCubit.get(context).changeShowMenu2();
                                                          // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                                          // List<Weight> weightData =
                                                          //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                                        },
                                                        child: Text(_list3[index])),
                                                separatorBuilder: (context, index) =>
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                itemCount: snapshot.data['ClientRefferalList'].length),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        Text(" الملاحظات", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Cairo'
                        ),),
                        leadTextfield(type: TextInputType.text,
                            txt: 'ملاحظات',
                            height: 100),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: (AppCubit.get(context).isAddLeaded) ? Container(
                            child: Center(child: CircularProgressIndicator(),),) :
                          BlocConsumer<AppCubit, AppStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return AppCubit.get(context).isAddLeaded ? CircularProgressIndicator() :
                              InkWell(
                                onTap: () {
                                  AppCubit.get(context).changeAddLeaded();
                                  addClient(
                                    context: context,
                                    status: 'archive',
                                    // uID: '1',
                                    email: email.text.toString(),
                                    phone: otherPhoneNum.text.toString(),
                                    cellphone: phoneNum.text.toString(),
                                    whatsapp: whatsAppPhoneNum.text.toString(),
                                    name: name.text.toString(),
                                    job: jobTitle.text.toString(),
                                    address: adderss.text.toString(),
                                    referral: 'facebook',
                                  );
                                  print('email----------------------------------------${email.text.toString()}');
                                  print('whatsapp----------------------------------------${whatsAppPhoneNum.text.toString()}');
                                  print('job----------------------------------------${jobTitle.text.toString()}');
                                  print('address----------------------------------------${adderss.text.toString()}');
                                  print('otherPhoneNum----------------------------------------${otherPhoneNum.text.toString()}');
                                  print('cellphone----------------------------------------${phoneNum.text.toString()}');
                                  print('name----------------------------------------${name.text.toString()}');
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: HexColor('#2972B7'),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      } else {
                return Center(child: Container(
                  child: Text('لا يوجد بيانات',style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),),
                ));
              }}
         ),
    );
  }

  leadTextfield({required TextInputType type, TextEditingController? controller,  double? height, String? title,String? txt}) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor("#E6E6E6")
      ),
      child: TextFormField(
        initialValue: txt,
        // maxLines: lines,
        controller: controller,
        textDirection: TextDirection.rtl,
        keyboardType: type,
        // controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Cairo',
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: '',
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
