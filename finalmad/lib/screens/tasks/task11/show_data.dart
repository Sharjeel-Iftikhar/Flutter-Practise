
import 'package:flutter/material.dart';
import 'data_view.dart';
import './model.dart';
import './api_service.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late Future<List<Todo>> futureService;
  late List dataA;
  @override
  void initState() {
    super.initState();
    futureService = fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text("Todos"),
          const SizedBox(height: 20),
          FutureBuilder<List<Todo>>(
            future: futureService,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final services = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(), // new

                    shrinkWrap: true,
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return MyDataView(
                        id: services[index].id,
                        todo: services[index].todo.toString(),
                        userId: services[index].userId,
                        complete: services[index].completed,
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
                // return Text('Data Not Found');
              }
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
