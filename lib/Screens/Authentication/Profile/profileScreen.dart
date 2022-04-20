import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Logics/StateManagement/Bloc/bloc_states.dart';
import '../../../Logics/StateManagement/Bloc/profile_bloc.dart';
import '../../../shared/constants/size_config.dart';
import '../../../shared/Components/input_field_widget.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      create: (BuildContext context) => ProfileBloc(),
      child: BlocConsumer<ProfileBloc, AppStates>(
        listener: (context, state) {
          var cubit = ProfileBloc.get(context);
        },
        builder: (context, state) {
          ProfileBloc cubit = ProfileBloc.get(context);

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  'الملف الشخصي',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: HexColor('000000'),
                      ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    )
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundColor: HexColor('333739'),
                              radius: 50,
                              child: Icon(
                                Icons.person_outline_outlined,
                                size: 50,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: HexColor('5682FF'),
                                radius: 15,
                                child: SvgPicture.asset(
                                  'assets/images/editpic.svg',
                                  width: 10,
                                  height: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 33,
                              ),
                              buildColumn(text: "User Name"),
                              InputFieldWidget(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                hint: 'Enter your User Name',
                                fieldKey: "user name",
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              buildColumn(text: "Email"),
                              InputFieldWidget(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                hint: 'Enter your User Name',
                                fieldKey: "user name",
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              buildColumn(text: "Phone"),
                              InputFieldWidget(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                hint: 'Enter your User Name',
                                fieldKey: "user name",
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: 200,
                              ),
                              Center(
                                child: Container(
                                  width: 320,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: HexColor('27A8FF'),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {}
                                    },
                                    child: Text(
                                      'حفظ',
                                      style: TextStyle(
                                        fontFamily: 'AlmaraiBold',
                                        fontSize: 16,
                                        color: HexColor('ECEFF5'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
  Column buildColumn({required String text}) {
    return Column(
      children: [
        Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: HexColor('0053CB'),
            fontSize: 14,
            //height:0.01727861771 ,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: SizeConfig.getProportionateScreenHeight(8),
        ),
      ],
    );
  }

}
