abstract final class TaskCategories {
  static const cleaning = 'Reinigen';
  static const organize = 'Organisieren';
  static const declutter = 'Entsorgen';
}

class TaskVariant {
  final int energyLevel;
  final String description;
  final int timeMinutes;

  const TaskVariant({
    required this.energyLevel,
    required this.description,
    required this.timeMinutes,
  });
}

class Task {
  final String id;
  final String title;
  final String category;
  final List<String> relatedAreas;
  final List<String> relatedActivities;
  final List<TaskVariant> variants;
  final int cooldownDays;

  const Task({
    required this.id,
    required this.title,
    required this.category,
    required this.relatedAreas,
    required this.relatedActivities,
    required this.variants,
    required this.cooldownDays,
  });
}

// ========================================
// SAMPLE TASKS PRO RAUM
// ========================================

const tasks = <Task>[
  // 🚿 BATHROOM
  Task(
    id: "bathroom_toilet_cleaning",
    title: "Toilette reinigen",
    category: TaskCategories.cleaning,
    relatedAreas: ["bathroom", "guest_bathroom"],
    relatedActivities: ["cleaning"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell die Kloschüssel mit Bürste durchgehen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Kloschüssel mit Bürste reinigen\n2. Kurz über den Sitz wischen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. WC-Reiniger einwirken lassen\n2. Kloschüssel schrubben\n3. Sitz und Deckel abwischen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. WC-Reiniger einwirken lassen\n2. Kloschüssel gründlich schrubben\n3. Sitz, Deckel und Außenseite reinigen\n4. Toilettenpapier-Halterung abwischen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. WC-Reiniger einwirken lassen\n2. Kloschüssel sehr gründlich schrubben (auch unter dem Rand)\n3. Komplette Toilette außen reinigen\n4. Toilettenpapier-Halterung reinigen\n5. Boden um die Toilette wischen',
        timeMinutes: 20,
      ),
    ],
  ),

  // 🍳 KITCHEN
  Task(
    id: "kitchen_wipe_surfaces",
    title: "Arbeitsflächen abwischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["kitchen"],
    relatedActivities: ["cleaning", "wiping"],
    cooldownDays: 2,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell über die Hauptfläche wischen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Arbeitsfläche frei räumen\n2. Kurz abwischen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Arbeitsflächen frei räumen\n2. Gründlich abwischen\n3. Herdplatten kurz säubern',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alle Oberflächen frei räumen\n2. Gründlich abwischen\n3. Herd säubern\n4. Spüle kurz auswischen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Oberflächen komplett frei räumen\n2. Sehr gründlich abwischen\n3. Herd komplett säubern\n4. Spüle gründlich reinigen\n5. Fensterbank und Ablagen auch machen',
        timeMinutes: 25,
      ),
    ],
  ),

  // 🛋️ LIVING_ROOM
  Task(
    id: "living_room_tidy_up",
    title: "Wohnzimmer aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["living_room"],
    relatedActivities: ["organizing", "tidying"],
    cooldownDays: 3,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell 5 Dinge wegräumen die rumliegen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Offensichtlich rumliegende Sachen wegräumen\n2. Kissen auf Sofa arrangieren',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle rumliegenden Sachen wegräumen\n2. Kissen arrangieren\n3. Couchtisch aufräumen',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplettes Wohnzimmer durchgehen\n2. Alles an seinen Platz räumen\n3. Kissen und Decken arrangieren\n4. Couchtisch und TV-Möbel aufräumen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Wohnzimmer komplett aufräumen\n2. Kissen, Decken, Fernbedienungen ordnen\n3. Alle Oberflächen frei räumen\n4. Magazine/Zeitungen sortieren\n5. Pflanzen gießen',
        timeMinutes: 30,
      ),
    ],
  ),

  // 🛏️ BEDROOM
  Task(
    id: "bedroom_make_bed",
    title: "Bett machen",
    category: TaskCategories.organize,
    relatedAreas: ["bedroom", "guest_room"],
    relatedActivities: ["organizing"],
    cooldownDays: 1,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Decke grob zurecht ziehen',
        timeMinutes: 2,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Decke ordentlich ausbreiten\n2. Kissen aufschütteln',
        timeMinutes: 4,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Bettdecke ordentlich ausbreiten\n2. Kissen aufschütteln und arrangieren\n3. Bett glatt ziehen',
        timeMinutes: 6,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Bettdecke perfekt ausbreiten\n2. Alle Kissen aufschütteln und schön arrangieren\n3. Bett komplett glatt ziehen\n4. Nachtkästchen kurz aufräumen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Bett komplett neu machen\n2. Alle Kissen perfekt arrangieren\n3. Tagesdecke glatt ziehen\n4. Nachtkästchen aufräumen\n5. Kuscheltiere/Deko arrangieren',
        timeMinutes: 15,
      ),
    ],
  ),

  // 👶 KIDS_ROOM
  Task(
    id: "kids_room_toys",
    title: "Spielzeug aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["kids_room"],
    relatedActivities: ["organizing", "tidying"],
    cooldownDays: 1,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Die größten Spielsachen in die Kiste werfen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Spielsachen vom Boden aufheben\n2. In Kisten werfen',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Spielsachen nach Art sortieren\n2. In die richtigen Kisten räumen\n3. Boden frei machen',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Spielsachen komplett sortieren\n2. In die richtigen Kisten räumen\n3. Bücher ins Regal stellen\n4. Boden komplett frei räumen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Spielsachen sortieren und ordnen\n2. Kisten beschriften\n3. Bücher nach Größe sortieren\n4. Bastelsachen organisieren\n5. Schreibtisch aufräumen',
        timeMinutes: 30,
      ),
    ],
  ),

  // 💼 OFFICE
  Task(
    id: "office_desk_clear",
    title: "Schreibtisch aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["office"],
    relatedActivities: ["organizing", "decluttering"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell 5 Dinge vom Schreibtisch wegräumen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Offensichtliche Dinge wegräumen\n2. Papiere in einen Stapel legen',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Schreibtisch komplett leer räumen\n2. Papiere sortieren\n3. Stifte ordnen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schreibtisch komplett aufräumen\n2. Papiere sortieren und abheften\n3. Stifte und Utensilien ordnen\n4. Ablagefächer durchsehen',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Schreibtisch komplett leer räumen\n2. Alle Papiere sortieren und ablegen\n3. Schreibutensilien perfekt organisieren\n4. Kabel ordnen\n5. Schubladen aussortieren',
        timeMinutes: 35,
      ),
    ],
  ),

  // 🚪 HALLWAY / ENTRANCE
  Task(
    id: "entrance_tidy",
    title: "Eingangsbereich aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["hallway", "entrance"],
    relatedActivities: ["organizing"],
    cooldownDays: 3,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schuhe grob sortieren',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Schuhe ordentlich aufstellen\n2. Jacken aufhängen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Schuhe sortieren und aufstellen\n2. Jacken und Mäntel aufhängen\n3. Taschen wegräumen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schuhe komplett sortieren\n2. Garderobe ordnen\n3. Taschen und Rucksäcke wegräumen\n4. Schlüssel und Kleinkram organisieren',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Kompletten Eingang aufräumen\n2. Schuhe sortieren (Winterschuhe weg?)\n3. Garderobe durchsehen\n4. Ablagefach organisieren\n5. Fußmatte ausschütteln',
        timeMinutes: 25,
      ),
    ],
  ),

  // 🌳 GARDEN / BALCONY
  Task(
    id: "balcony_tidy",
    title: "Balkon aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["balcony", "terrace", "garden"],
    relatedActivities: ["organizing", "tidying"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlichen Müll wegwerfen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Müll wegwerfen\n2. Stühle gerade rücken',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Balkon durchfegen\n2. Möbel ordnen\n3. Pflanzen checken',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Balkon gründlich fegen\n2. Möbel ordnen und abwischen\n3. Pflanzen gießen\n4. Deko arrangieren',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Balkon komplett fegen\n2. Möbel reinigen und ordnen\n3. Alle Pflanzen gießen und pflegen\n4. Geländer abwischen\n5. Deko schön arrangieren',
        timeMinutes: 35,
      ),
    ],
  ),

  // 🚗 GARAGE / BASEMENT
  Task(
    id: "garage_declutter",
    title: "Garage entrümpeln",
    category: TaskCategories.declutter,
    relatedAreas: ["garage", "basement", "storage"],
    relatedActivities: ["decluttering", "organizing"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Eine Ecke kurz durchsehen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Eine kleine Fläche freiräumen\n2. Offensichtlicher Müll raus',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Eine Ecke komplett durchgehen\n2. Müll aussortieren\n3. Rest grob ordnen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Einen Bereich komplett entrümpeln\n2. Müll entsorgen\n3. Brauchbares sortieren\n4. Werkzeug ordnen',
        timeMinutes: 25,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Großen Bereich entrümpeln\n2. Alles aussortieren\n3. Spenden-Kiste packen\n4. Werkzeug und Utensilien organisieren\n5. Regale neu sortieren',
        timeMinutes: 45,
      ),
    ],
  ),

  // ========================================
  // SAMPLE TASKS PRO TÄTIGKEIT
  // ========================================

  // 🧹 CLEANING (generisch, mehrere Räume)
  Task(
    id: "general_dusting",
    title: "Staub wischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["living_room", "bedroom", "office", "hallway"],
    relatedActivities: ["cleaning", "dusting"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell über 2-3 Oberflächen wischen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Hauptflächen abstauben\n2. Sichtbare Bereiche reinigen',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle sichtbaren Flächen abstauben\n2. Fensterbank mit machen\n3. Regale kurz durchwischen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alle Oberflächen gründlich abstauben\n2. Fensterbank reinigen\n3. Regale durchwischen\n4. Bilderrahmen und Deko entstauben',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Kompletten Raum abstauben\n2. Alle Oberflächen, auch schwer erreichbare\n3. Lampen entstauben\n4. Deko gründlich reinigen\n5. Hinter Möbeln auch',
        timeMinutes: 35,
      ),
    ],
  ),

  // 🗑️ DECLUTTERING (Entsorgen/Aussortieren)
  Task(
    id: "general_trash_disposal",
    title: "Müll entsorgen",
    category: TaskCategories.declutter,
    relatedAreas: ["kitchen", "bathroom", "bedroom", "office"],
    relatedActivities: ["decluttering", "disposing"],
    cooldownDays: 3,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Einen Mülleimer leeren',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Hauptmülleimer leeren\n2. Neuen Beutel rein',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Mülleimer im Raum leeren\n2. Neue Beutel einlegen\n3. Altpapier sammeln',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alle Mülleimer leeren\n2. Neue Beutel einlegen\n3. Müll rausbringen\n4. Pfandflaschen sammeln',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Mülleimer im Haushalt leeren\n2. Müll rausbringen\n3. Mülltrennung checken\n4. Pfand wegbringen\n5. Mülleimer auswischen',
        timeMinutes: 25,
      ),
    ],
  ),

  // 🧺 WASHING (Wäsche)
  Task(
    id: "general_laundry",
    title: "Wäsche waschen",
    category: TaskCategories.cleaning,
    relatedAreas: ["bathroom", "bedroom", "laundry_room"],
    relatedActivities: ["washing", "laundry"],
    cooldownDays: 2,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Eine Maschine anwerfen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Wäsche sortieren\n2. Eine Maschine starten',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Wäsche sortieren\n2. Maschine beladen und starten\n3. Trockene Wäsche abnehmen',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplette Wäsche sortieren\n2. Maschine starten\n3. Trockene Wäsche abnehmen und zusammenlegen\n4. Wäscheständer aufräumen',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Wäschekörbe durchgehen\n2. Nach Farben sortieren\n3. 2 Maschinen durchlaufen lassen\n4. Wäsche zusammenlegen und wegräumen\n5. Wäscheständer reinigen',
        timeMinutes: 60,
      ),
    ],
  ),

  // 🧽 MOPPING (Boden wischen)
  Task(
    id: "general_floor_mopping",
    title: "Boden wischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["kitchen", "bathroom", "hallway"],
    relatedActivities: ["mopping", "cleaning"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Nur die schmutzigsten Stellen wischen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Hauptfläche kurz durchwischen\n2. Sichtbare Flecken entfernen',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Boden frei räumen\n2. Komplett durchwischen\n3. Ecken mit machen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Boden komplett frei räumen\n2. Gründlich wischen\n3. Auch unter Möbeln\n4. Ecken und Übergänge säubern',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Boden komplett frei räumen\n2. Erstmal fegen/saugen\n3. Sehr gründlich wischen\n4. Alle Ecken und schwer erreichbare Stellen\n5. Fußleisten auch',
        timeMinutes: 35,
      ),
    ],
  ),

  // 🔧 MAINTENANCE (Wartung/Pflege)
  Task(
    id: "general_plant_care",
    title: "Pflanzen pflegen",
    category: TaskCategories.organize,
    relatedAreas: ["living_room", "bedroom", "office", "balcony"],
    relatedActivities: ["maintenance", "care"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: '1-2 Pflanzen gießen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Pflanzen im Raum gießen\n2. Schnell Finger-Test ob Erde trocken',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Pflanzen checken\n2. Trockene gießen\n3. Braune Blätter entfernen',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alle Pflanzen gießen\n2. Tote Blätter entfernen\n3. Blätter abstauben\n4. Übertöpfe säubern',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Pflanzen im Haushalt pflegen\n2. Gießen nach Bedarf\n3. Blätter abstauben und pflegen\n4. Umtopfen wenn nötig\n5. Düngen\n6. Schädlinge checken',
        timeMinutes: 40,
      ),
    ],
  ),

  // 📦 ORGANIZING (Organisieren/Sortieren)
  Task(
    id: "general_drawer_organize",
    title: "Schubladen sortieren",
    category: TaskCategories.organize,
    relatedAreas: ["kitchen", "bedroom", "office", "bathroom"],
    relatedActivities: ["organizing", "sorting"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Eine Schublade grob durchsehen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description:
            '1. Eine Schublade ausräumen\n2. Offensichtlich Falsches raus\n3. Rest wieder rein',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Schublade komplett ausräumen\n2. Sortieren und aussortieren\n3. Sauber wieder einräumen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schublade ausräumen\n2. Auswischen\n3. Alles sortieren\n4. Nur Brauchbares zurück\n5. Übersichtlich einräumen',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Schublade komplett leeren\n2. Gründlich reinigen\n3. Alles sortieren und aussortieren\n4. Organizer/Trenner einsetzen\n5. Perfekt sortiert einräumen',
        timeMinutes: 35,
      ),
    ],
  ),
];
