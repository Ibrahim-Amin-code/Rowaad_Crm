import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:crm_app/screens/home/component/leads/add_new_lead.dart';
import 'package:crm_app/screens/home/component/leads/components.dart';
import 'package:crm_app/screens/home/component/leads/controller/api_genral_info.dart';
import 'package:crm_app/screens/home/component/leads/controller/api_update_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateClintData extends StatefulWidget {
  final String clientId;
  final String clientName;
  final String clientPhoneNum;
  final String clientOtherPhoneNum;
  final String clientWhatsAppPhoneNum;
  final String clientJobTitle;
  final String clientAdderss;
  final String clientEmail;

  const UpdateClintData(
      {Key? key,
      required this.clientId,
      required this.clientName,
      required this.clientPhoneNum,
      required this.clientOtherPhoneNum,
      required this.clientWhatsAppPhoneNum,
      required this.clientJobTitle,
      required this.clientAdderss,
      required this.clientEmail})
      : super(key: key);

  // String get txt => null;


  @override
  _UpdateClintDataState createState() => _UpdateClintDataState();
}

class _UpdateClintDataState extends State<UpdateClintData> {
  @override
  var _list = [];
  var _list2 = [];
  var _list3 = [];

  Widget build(BuildContext context) {
    TextEditingController whatsapp = TextEditingController(text: (widget.clientWhatsAppPhoneNum != 'null') ?widget.clientWhatsAppPhoneNum : 'لا يوجد');
    TextEditingController status = TextEditingController(text: 'Cold');
    TextEditingController referral = TextEditingController(text: 'FaceBook');
    TextEditingController address = TextEditingController(text: (widget.clientAdderss != 'null') ?widget.clientAdderss : 'لا يوجد');
    TextEditingController phone = TextEditingController(text: (widget.clientOtherPhoneNum != 'null') ?widget.clientOtherPhoneNum : 'لا يوجد');
    TextEditingController email = TextEditingController(text: (widget.clientEmail != 'null') ? widget.clientEmail : 'لا يوجد');
    TextEditingController cellphone = TextEditingController(text: (widget.clientPhoneNum != 'null') ?widget.clientPhoneNum : 'لا يوجد');
    TextEditingController job = TextEditingController(text: (widget.clientJobTitle != 'null')? widget.clientJobTitle : 'لا يوجد');
    TextEditingController name = TextEditingController(text: (widget.clientName != 'null')? widget.clientName : 'لا يوجد');

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text('بيانات العميل',
              style: TextStyle(
              fontSize: 14,fontFamily: 'Cairo' ,fontWeight: FontWeight.bold,color: Colors.black
            ),),
          ),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: getGeneralInfo(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){

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
              child: ListView(
                shrinkWrap: true,
                primary: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                children: [
                  Text("تعديل بيانات العميل",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("الاسم *",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'الاسم',
                    type: TextInputType.text,
                    double: 50,
                    controller: name,
                    // initialValue: widget.clientName,
                    // (widget.clientName != 'null') ? widget.clientName : 'لا يوجد',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("رقم الهاتف *",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'رقم الهاتف',
                    type: TextInputType.phone,
                    double: 50,
                    controller: cellphone,
                    // initialValue: (widget.clientPhoneNum != 'null') ? widget.clientPhoneNum : 'لا يوجد',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("رقم الوتس أب *",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'رقم WhatsApp',
                    type: TextInputType.phone,
                    double: 50,
                    controller: whatsapp,
                    // initialValue: (widget.clientWhatsAppPhoneNum != 'null') ? widget.clientWhatsAppPhoneNum : 'لا يوجد',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("رقم هاتف اخر ",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'رقم هاتف اخر',
                    type: TextInputType.phone,
                    double: 50,
                    controller: phone,
                    // initialValue: (widget.clientOtherPhoneNum != 'null') ? widget.clientOtherPhoneNum : 'لا يوجد',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("المسمى الوظيفي",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'Job Title',
                    type: TextInputType.text,
                    double: 50,
                    controller: job,
                    // initialValue: (widget.clientJobTitle != 'null') ? widget.clientJobTitle : 'لا يوجد',
                   ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("العنوان ",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'العنوان',
                    type: TextInputType.text,
                    double: 50,
                    controller:address,
                    // initialValue: (widget.clientAdderss != 'null') ? widget.clientAdderss : 'لا يوجد',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("البريد الإلكتروني ",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'البريد الالكتروني',
                    type: TextInputType.emailAddress,
                    double: 50,
                    controller: email,
                    // initialValue: (widget.clientEmail != 'null') ? widget.clientEmail : 'لا يوجد',
                  ),
                  SizedBox(
                    height: 5,
                  ),

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
                                  EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
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
                                  padding: const EdgeInsets.only(top: 18, right: 80),
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
                                            padding: EdgeInsets.only(left: 10, top: 10),
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
                                                    child: Text(_list[index])),
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
                            padding: const EdgeInsets.only( right: 5),
                            child: Text('حالة العميل',style: TextStyle(
                              fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.bold,
                            ),),
                          ),
                          Stack(
                            children: [
                              InkWell(
                                onTap: ()=> AppCubit.get(context).changeShowMenu1(),
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                      color: HexColor('#E6E6E6'),
                                      borderRadius: BorderRadius.circular(10)),
                                  // margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 50,
                                  width: 170,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(AppCubit.get(context).textMenu1.toString(),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Icon(Icons.keyboard_arrow_down_outlined,),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: AppCubit.get(context).showMenu1,
                                child: Padding(
                                  padding: const EdgeInsets.only(top:18 ,right: 80),
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
                                                  offset:Offset(0,1),
                                                  spreadRadius: 1
                                              ),
                                            ]
                                        ),
                                        // color: Colors.red,
                                        child: ListView.separated(
                                            padding: EdgeInsets.only(left: 10,top: 10),
                                            itemBuilder: (context , index) => InkWell(
                                                onTap: (){
                                                  // print('ggg ${_list[0]}');
                                                  AppCubit.get(context).changeTextMenu1(val: _list2[index].toString());
                                                  AppCubit.get(context).changeShowMenu1();
                                                  // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                                  // List<Weight> weightData =
                                                  //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                                },
                                                child: Text(_list2[index])),
                                            separatorBuilder:(context , index) => SizedBox(
                                              height: 20,
                                            ),
                                            itemCount: snapshot.data['ClientStatusList'].length)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only( right: 5),
                            child: Text('مصدر العميل',style: TextStyle(
                              fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.bold,
                            ),),
                          ),
                          Stack(
                            children: [
                              InkWell(
                                onTap: ()=> AppCubit.get(context).changeShowMenu2(),
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                      color: HexColor('#E6E6E6'),
                                      borderRadius: BorderRadius.circular(10)),
                                  // margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 50,
                                  width: 170,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(AppCubit.get(context).textMenu2.toString(),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Icon(Icons.keyboard_arrow_down_outlined,),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: AppCubit.get(context).showMenu2,
                                child: Padding(
                                  padding: const EdgeInsets.only(top:18 ,right: 80),
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
                                                offset:Offset(0,1),
                                                spreadRadius: 1
                                            ),
                                          ]
                                      ),
                                      child: ListView.separated(
                                          padding: EdgeInsets.only(left: 10,top: 10),
                                          itemBuilder: (context , index) => InkWell(
                                              onTap: (){
                                                // print('ggg ${_list[0]}');
                                                AppCubit.get(context).changeTextMenu2(val: _list3[index].toString());
                                                AppCubit.get(context).changeShowMenu2();
                                                // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                                // List<Weight> weightData =
                                                //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                              },
                                              child: Text(_list3[index])),
                                          separatorBuilder:(context , index) => SizedBox(
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











                  Text("ملاحظات ",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  buildUpdateFormField(
                    hintText: 'ملاحظات',
                    type: TextInputType.text,
                    double: 150,
                    // initialValue: '',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        updateClient(
                          clientId: widget.clientId.toString(),
                          job: job.text.toString(),
                          name: name.text.toString(),
                          cellphone: cellphone.text.toString(),
                          email: email.text.toString(),
                          phone: phone.text.toString(),
                          address: address.text.toString(),
                          referral: referral.text.toString(),
                          status: status.text.toString(),
                          context: context,
                          whatsapp: whatsapp.text.toString(),
                        );
                        print('whatsapp---------------------${whatsapp.toString()}');
                        print('job---------------------${job.toString()}');
                        print('cellphone---------------------${cellphone.toString()}');
                        print('email---------------------${email.toString()}');
                        print('phone---------------------${phone.toString()}');
                        print('address---------------------${address.toString()}');
                        print('clientId---------------------${widget.clientId.toString()}');
                        print('name---------------------${name.toString()}');
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
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Container(
              child: Text('لا يوجد بيانات', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
                fontSize: 16,
                color: Colors.red
              ),),
            );
          }
        },
      ),
    );
  }
}

buildUpdateFormField({
  required double? double,
  required String? hintText,
  // required String? initialValue,
  required TextInputType? type,
  // required ValueChanged<String>? onChanged,
  // required ValueChanged<String>? onFieldSubmitted,
  // required FormFieldSetter<String>? onSaved,
  // required GestureTapCallback? onTap,
  TextEditingController? controller,
}) {
  return Container(
    height: double,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: HexColor("#E6E6E6")),
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
          ),
        ),
        // onTap: onTap,
        // onFieldSubmitted: onFieldSubmitted,
        // onChanged: onChanged,
        // onSaved: onSaved,
        keyboardType: type,
        // initialValue: initialValue,
      ),
    ),
  );
}
