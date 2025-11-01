import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskTimerScreen extends StatelessWidget {
  const TaskTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Timer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mood, size: 100),
            const SizedBox(height: 20),
            Text(
              'Task Timer Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            const Text('Coming soon...'),
          ],
        ),
      ),
    );
  }
}
