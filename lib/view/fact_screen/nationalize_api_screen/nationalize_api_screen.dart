import 'package:api_integration_sample/controler/nationalize_api_screen_controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NationalizeApiScreen extends StatefulWidget {
  const NationalizeApiScreen({super.key});

  @override
  State<NationalizeApiScreen> createState() => _NationalizeApiScreenState();
}

class _NationalizeApiScreenState extends State<NationalizeApiScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
       await context.read<NationalizeApiScreenControler>().fetchNationalizeData();
      } ,);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final NationalizeApiScreenState = context.watch<NationalizeApiScreenControler>();
    return Scaffold(
      appBar: AppBar(
        leading: Text(NationalizeApiScreenState.count.toString()),
        centerTitle: true,
        title: Text(NationalizeApiScreenState.name.toString()),
      ) ,
      body: NationalizeApiScreenState.isLoading == true
      ?Center(child: CircularProgressIndicator(),)
      :ListView.separated(itemBuilder: (context, index) => ListTile(
        leading: Text(NationalizeApiScreenState.countryList[index].countryId.toString()),
        title: Text(NationalizeApiScreenState.countryList[index].probability.toString()),
      ), separatorBuilder: (context, index) => Divider(),
       itemCount: NationalizeApiScreenState.countryList.length),
    );
  }
}