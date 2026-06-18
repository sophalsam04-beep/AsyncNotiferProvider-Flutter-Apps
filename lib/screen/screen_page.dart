import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:self_learn8/service/api_service.dart';
import 'package:self_learn8/model/user_model.dart';
import 'package:self_learn8/notifier/userNotifier_provider.dart';
import 'package:self_learn8/notifier/user_notifier.dart';

class ScreenPage extends ConsumerWidget {
  const ScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text("AsyncNotifier Provider")),
      body: users.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final user = data[index];
              return ListTile(
                leading: CircleAvatar(child: Text(user.id.toString())),
                title: Text("${user.name}"),
                subtitle: Text("${user.email}"),

                trailing: IconButton(
                  onPressed: () {
                    ref.read(userProvider.notifier).refreshData();
                  },
                  icon: Icon(Icons.refresh, size: 35),
                ),
              );
            },
          );
        },

        error: (error, stackTrace) => Center(child: Text(error.toString())),

        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
