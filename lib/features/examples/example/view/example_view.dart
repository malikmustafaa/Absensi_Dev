import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/example_view_model.dart';

class ExamplePage extends StatefulWidget {
  static const routeName = "/ExamplePage";

  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ExampleViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<ExampleViewModel>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("LOGIN"),
              Consumer<ExampleViewModel>(
                builder: (context, provider, child) {
                  return TextField(
                    decoration: const InputDecoration(
                      label: Text("User ID"),
                    ),
                    controller: provider.controllerUserId,
                  );
                },
              ),
              Consumer<ExampleViewModel>(
                builder: (context, provider, child) {
                  return TextField(
                    decoration: const InputDecoration(
                      label: Text("Password"),
                    ),
                    controller: provider.controllerPassword,
                  );
                },
              ),
              Consumer<ExampleViewModel>(
                builder: (context, provider, child) {
                  return Text(provider.token);
                },
              ),
              Consumer<ExampleViewModel>(
                builder: (context, provider, child) {
                  return Text(provider.email);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  provider.login(context);
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
