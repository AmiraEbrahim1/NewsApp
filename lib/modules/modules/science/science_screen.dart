import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/layout.news_app/cubit/states.dart';

import '../../../components/components.dart';
import '../../../layout/layout.news_app/cubit/cubit.dart';
class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  _ScienceScreenState createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).science;
    return BlocConsumer <NewsCubit,NewsStates>(
        listener: (context, state) {} ,
        builder:(context,state){
          return condBuilder(list,context);
        }


    );
  }
}