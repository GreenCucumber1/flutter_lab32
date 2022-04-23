import 'package:provider/provider.dart';


import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'my_home_page2.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);

 
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("WeatherBit API"),
      ),
      body: Center (
        
        child: Container(
          margin: const EdgeInsets.all(15.0),
          color: const Color.fromARGB(255, 218, 233, 233),
          width: 1200,
          height: 500,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                         
              const Padding(
                padding: EdgeInsets.only(bottom: 20),),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Print lat and lon',
                    style: TextStyle(fontSize: 25, color: Colors.black)),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(                      
                  width: 50,
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Lan',
                     
                    ),
                  ),
                ),
              ),

                Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(                      
                  width: 50,
                  child: TextFormField(
                    controller: _controller1,
                      decoration: const InputDecoration(
                      labelText: 'Lon',
                      
                    ),
                  ),
                ),
              ),
              



              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty && _controller1.text.isEmpty  ) {
                    
                  } else {
                    
                    String url = _controller.text;
                    String url1 = _controller1.text;
                    context.read<CharactersBloc>().add(LoadDataEvent(url1: url,url2: url1));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(url: url,url1:url1)));
                    _controller.clear();
                    _controller1.clear();
                  }
                },
                child: const Text("Check"),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
