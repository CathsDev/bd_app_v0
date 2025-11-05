abstract final class TaskCategories {
  static const cleaning = 'Reinigen';
  static const organize = 'Organisieren';
  static const declutter = 'Entsorgen';
}

class TaskVariant {
  final int relatedMood;
  final String description;
  final int timeMinutes;

  const TaskVariant({
    required this.relatedMood,
    required this.description,
    required this.timeMinutes,
  });
}

class TaskModel {
  final String id;
  final String title;
  final String category;
  final String relatedArea;
  final List<TaskVariant> variants;
  final int cooldown;

  const TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.relatedArea,
    required this.variants,
    required this.cooldown,
  });
}

const tasks = <TaskModel>[
  TaskModel(
    id: "kitchen_dispose_trash",
    title: "Müll entsorgen",
    category: TaskCategories.declutter,
    relatedArea: "kitchen",
    cooldown: 2,
    variants: [
      TaskVariant(
        relatedMood: 1,
        description: '1. ..., 2. ...',
        timeMinutes: 5,
      ),
      TaskVariant(
        relatedMood: 2,
        description: '1. ..., 2. ...',
        timeMinutes: 10,
      ),
      TaskVariant(
        relatedMood: 3,
        description: '1. ..., 2. ...',
        timeMinutes: 15,
      ),
      TaskVariant(
        relatedMood: 4,
        description: '1. ..., 2. ...',
        timeMinutes: 20,
      ),
      TaskVariant(
        relatedMood: 5,
        description: '1. ..., 2. ...',
        timeMinutes: 30,
      ),
    ],
  ),
];
