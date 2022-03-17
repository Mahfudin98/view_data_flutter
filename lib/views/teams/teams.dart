import 'package:flutter/material.dart';
import 'package:new_app/controller/teams/teams_controller.dart';
import 'package:new_app/service/network.dart';
import 'package:provider/provider.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams page"),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<TeamsController>(context, listen: false).getDataTeams(),
        child: FutureBuilder(
          future: Provider.of<TeamsController>(context, listen: false)
              .getDataTeams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Consumer<TeamsController>(
              builder: (context, data, _) {
                return ListView.builder(
                  itemCount: data.dataTeams.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 8,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              Network().imageURL + data.dataTeams[i].image),
                        ),
                        title: Text(data.dataTeams[i].name),
                        subtitle: Text(data.dataTeams[i].position),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
