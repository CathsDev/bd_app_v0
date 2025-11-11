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
// AREA IDs KORRIGIERT:
// ✅ living (nicht living_room)
// ✅ kids (nicht kids_room)
// ✅ bedroom, kitchen, bath, office, hallway
// ✅ guest (nicht guest_room), guest_bath (nicht guest_bathroom)
// ✅ storage, laundry, balcony
// ========================================

const tasks = <Task>[
  // === BATHROOM ===
  Task(
    id: "bathroom_toilet_cleaning",
    title: "Toilette reinigen",
    category: TaskCategories.cleaning,
    relatedAreas: ["bath", "guest_bath"],
    relatedActivities: ["cleaning"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell die Kloschüssel mit Bürste durchgehen',
        timeMinutes: 1,
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

  Task(
    id: "bathroom_organize_cabinet",
    title: "Badezimmerschrank aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["bath"],
    relatedActivities: ["organizing"],
    cooldownDays: 14,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Abgelaufene Produkte rauswerfen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Abgelaufenes raus\n2. Häufig genutztes nach vorne',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Schrank ausräumen\n2. Abgelaufenes entsorgen\n3. Nach Kategorien sortiert einräumen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schrank komplett ausräumen\n2. Auswischen\n3. Alles sortieren\n4. Übersichtlich einräumen',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Kompletten Schrank leeren\n2. Gründlich reinigen\n3. Alles sortieren\n4. Organizer einsetzen\n5. Perfekt organisiert einräumen',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "bathroom_declutter_products",
    title: "Alte Produkte aussortieren",
    category: TaskCategories.declutter,
    relatedAreas: ["bath"],
    relatedActivities: ["decluttering"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich alte Sachen rauswerfen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Alte Produkte finden\n2. Entsorgen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Produkte durchgehen\n2. Abgelaufenes raus\n3. Duplikate eliminieren',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplettes Bad durchsuchen\n2. Alles checken\n3. Aussortieren\n4. Entsorgen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Jedes Produkt checken\n2. Nach Datum bewerten\n3. Radikal aussortieren\n4. Entsorgen\n5. Inventar erstellen',
        timeMinutes: 30,
      ),
    ],
  ),

  // === KITCHEN ===
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
            '1. Alle Oberflächen komplett frei räumen\n2. Sehr gründlich abwischen\n3. Herd komplett säubern\n4. Spüle gründlich reinigen\n5. Fensterbank auch',
        timeMinutes: 25,
      ),
    ],
  ),

  Task(
    id: "kitchen_organize_fridge",
    title: "Kühlschrank aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["kitchen"],
    relatedActivities: ["organizing"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Abgelaufenes rauswerfen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Abgelaufenes entsorgen\n2. Kurz umsortieren',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alles durchgehen\n2. Abgelaufenes raus\n3. Nach Kategorien sortieren',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Kühlschrank ausräumen\n2. Fächer auswischen\n3. Sortiert einräumen\n4. Daten checken',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Komplett leeren\n2. Gründlich putzen\n3. Alles sortieren\n4. System einführen\n5. Perfekt einräumen',
        timeMinutes: 35,
      ),
    ],
  ),

  Task(
    id: "kitchen_declutter_pantry",
    title: "Vorratsschrank ausmisten",
    category: TaskCategories.declutter,
    relatedAreas: ["kitchen"],
    relatedActivities: ["decluttering"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich altes rauswerfen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Abgelaufenes finden\n2. Entsorgen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Lebensmittel checken\n2. Abgelaufenes raus\n3. Duplikate zusammenführen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Kompletten Schrank durchgehen\n2. Nach Datum sortieren\n3. Aussortieren\n4. Neu organisieren',
        timeMinutes: 25,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Schrank komplett leeren\n2. Reinigen\n3. Jedes Produkt checken\n4. Radikal aussortieren\n5. Inventar System',
        timeMinutes: 45,
      ),
    ],
  ),

  // === LIVING ===
  Task(
    id: "living_vacuum_floor",
    title: "Wohnzimmer saugen",
    category: TaskCategories.cleaning,
    relatedAreas: ["living"],
    relatedActivities: ["cleaning", "vacuuming"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Nur die Hauptfläche saugen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Grobe Flächen saugen\n2. Sichtbare Krümel weg',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Boden frei räumen\n2. Komplett saugen\n3. Unter Couchtisch auch',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alles vom Boden räumen\n2. Gründlich saugen\n3. Unter Möbeln\n4. Polster absaugen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Komplett frei räumen\n2. Sehr gründlich saugen\n3. Alle Ecken\n4. Unter allen Möbeln\n5. Polster und Vorhänge',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "living_room_tidy_up",
    title: "Wohnzimmer aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["living"],
    relatedActivities: ["organizing", "tidying"],
    cooldownDays: 3,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell 5 Dinge wegräumen',
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
            '1. Komplettes Wohnzimmer durchgehen\n2. Alles an seinen Platz\n3. Kissen und Decken arrangieren\n4. Couchtisch und TV-Möbel aufräumen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Wohnzimmer komplett aufräumen\n2. Alles ordnen\n3. Alle Oberflächen frei\n4. Magazine sortieren\n5. Pflanzen gießen',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "living_declutter_magazines",
    title: "Zeitschriften aussortieren",
    category: TaskCategories.declutter,
    relatedAreas: ["living"],
    relatedActivities: ["decluttering"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Alte Magazine in Altpapier',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Zeitschriften durchsehen\n2. Alte entsorgen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Magazine sortieren\n2. Behalten vs. Weg\n3. Entsorgen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplette Sammlung durchgehen\n2. Nach Relevanz sortieren\n3. Radikal aussortieren\n4. Rest stapeln',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Printmedien finden\n2. Kategorisieren\n3. Aussortieren\n4. Wichtiges digitalisieren\n5. Entsorgen',
        timeMinutes: 30,
      ),
    ],
  ),

  // === BEDROOM ===
  Task(
    id: "bedroom_change_bedding",
    title: "Bettwäsche wechseln",
    category: TaskCategories.cleaning,
    relatedAreas: ["bedroom", "guest"],
    relatedActivities: ["cleaning", "laundry"],
    cooldownDays: 14,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Nur Kissenbezüge wechseln',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Kissenbezüge neu\n2. Bettdecke neu beziehen',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Komplette Bettwäsche abziehen\n2. Neue aufziehen\n3. Bett machen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Bettwäsche komplett wechseln\n2. Matratze lüften\n3. Neue Wäsche aufziehen\n4. Bett perfekt machen',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Komplettes Bett abziehen\n2. Matratze drehen und lüften\n3. Matratze absaugen\n4. Frische Bettwäsche aufziehen\n5. Perfekt herrichten',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "bedroom_make_bed",
    title: "Bett machen",
    category: TaskCategories.organize,
    relatedAreas: ["bedroom", "guest"],
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
            '1. Bettdecke perfekt ausbreiten\n2. Alle Kissen schön arrangieren\n3. Bett komplett glatt\n4. Nachtkästchen kurz aufräumen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Bett komplett neu machen\n2. Alle Kissen perfekt\n3. Tagesdecke glatt\n4. Nachtkästchen aufräumen\n5. Deko arrangieren',
        timeMinutes: 15,
      ),
    ],
  ),

  Task(
    id: "bedroom_declutter_closet",
    title: "Kleiderschrank ausmisten",
    category: TaskCategories.declutter,
    relatedAreas: ["bedroom"],
    relatedActivities: ["decluttering", "sorting"],
    cooldownDays: 90,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich kaputtes raus',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Kaputte Kleidung finden\n2. Aussortieren',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Einen Schrank durchgehen\n2. Brauchbar vs. Raus\n3. Aussortiertes in Tüte',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schrank komplett durchgehen\n2. Alles anprobieren\n3. Radikal aussortieren\n4. Spenden/Wegwerfen',
        timeMinutes: 40,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Kompletten Schrank leeren\n2. Jedes Teil bewerten\n3. Konmari-Methode\n4. Spende/Verkauf/Müll\n5. Nur Geliebtes zurück',
        timeMinutes: 90,
      ),
    ],
  ),

  // === KIDS ===
  Task(
    id: "kids_room_clean_surfaces",
    title: "Kinderzimmer abwischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["kids"],
    relatedActivities: ["cleaning", "wiping"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Grobe Flecken wegwischen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Hauptflächen abwischen\n2. Sichtbare Flecken weg',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Oberflächen abwischen\n2. Regale entstauben\n3. Fensterbank reinigen',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplette Oberflächen reinigen\n2. Regale gründlich\n3. Spielzeug abwischen\n4. Fenster putzen',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alles im Zimmer abwischen\n2. Regale ausräumen und reinigen\n3. Spielzeug waschen\n4. Fenster komplett\n5. Hinter Möbeln auch',
        timeMinutes: 35,
      ),
    ],
  ),

  Task(
    id: "kids_room_toys",
    title: "Spielzeug aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["kids"],
    relatedActivities: ["organizing", "tidying"],
    cooldownDays: 1,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Die größten Spielsachen in die Kiste',
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
            '1. Spielsachen nach Art sortieren\n2. In richtige Kisten\n3. Boden frei',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Spielsachen komplett sortieren\n2. In richtige Kisten\n3. Bücher ins Regal\n4. Boden komplett frei',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Spielsachen sortieren\n2. Kisten beschriften\n3. Bücher nach Größe\n4. Bastelsachen organisieren\n5. Schreibtisch aufräumen',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "kids_room_declutter_toys",
    title: "Kaputtes Spielzeug aussortieren",
    category: TaskCategories.declutter,
    relatedAreas: ["kids"],
    relatedActivities: ["decluttering"],
    cooldownDays: 60,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich kaputtes raus',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Kaputtes Spielzeug finden\n2. Entsorgen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Spielzeug durchgehen\n2. Kaputtes und Ungenutztes\n3. Entsorgen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplettes Spielzeug sortieren\n2. Kaputt/Alt/Unbenutzt\n3. Spende vs. Müll\n4. Entsorgen',
        timeMinutes: 25,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alles Spielzeug raus\n2. Mit Kind durchgehen\n3. Aussortieren\n4. Spende organisieren\n5. Rest perfekt organisieren',
        timeMinutes: 45,
      ),
    ],
  ),

  // === OFFICE ===
  Task(
    id: "office_dust_surfaces",
    title: "Büro abstauben",
    category: TaskCategories.cleaning,
    relatedAreas: ["office"],
    relatedActivities: ["cleaning", "dusting"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schreibtisch kurz abstauben',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Schreibtisch abstauben\n2. Monitor kurz',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Oberflächen abstauben\n2. Monitor reinigen\n3. Regale durchwischen',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplettes Büro abstauben\n2. Monitor und Tastatur\n3. Regale gründlich\n4. Fensterbank',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alles abstauben\n2. Elektronik reinigen\n3. Regale ausräumen\n4. Kabel organisieren\n5. Hinter Möbeln',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "office_desk_clear",
    title: "Schreibtisch aufräumen",
    category: TaskCategories.organize,
    relatedAreas: ["office"],
    relatedActivities: ["organizing", "decluttering"],
    cooldownDays: 3,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell 5 Dinge wegräumen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Offensichtliches wegräumen\n2. Papiere stapeln',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Schreibtisch leer räumen\n2. Sortieren\n3. Nur Wichtiges zurück',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplett aufräumen\n2. Papiere abheften\n3. Stifte organisieren\n4. System einführen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Komplett leeren\n2. Alles kategorisieren\n3. Ablagesystem\n4. Digital organisieren\n5. Minimalistisch zurück',
        timeMinutes: 30,
      ),
    ],
  ),

  Task(
    id: "office_declutter_papers",
    title: "Papiere aussortieren",
    category: TaskCategories.declutter,
    relatedAreas: ["office"],
    relatedActivities: ["decluttering", "sorting"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich altes Papier weg',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Papiere durchsehen\n2. Unnötiges ins Altpapier',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Papierstapel durchgehen\n2. Wichtig vs. Unwichtig\n3. Unnötiges entsorgen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplette Papiere sortieren\n2. Nach Relevanz\n3. Wichtiges digitalisieren\n4. Rest entsorgen',
        timeMinutes: 25,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Dokumente durchgehen\n2. Digitalisierungssystem\n3. Wichtiges scannen\n4. Radikal aussortieren\n5. Nur Notwendiges',
        timeMinutes: 60,
      ),
    ],
  ),

  // === HALLWAY ===
  Task(
    id: "hallway_clean_floor",
    title: "Flur wischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["hallway"],
    relatedActivities: ["cleaning", "mopping"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Nur schmutzige Stellen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Hauptfläche wischen\n2. Sichtbare Flecken',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description: '1. Boden frei\n2. Komplett wischen\n3. Ecken auch',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schuhe wegräumen\n2. Gründlich wischen\n3. Fußleisten\n4. Fußmatte',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Komplett frei\n2. Erst saugen dann wischen\n3. Alle Ecken\n4. Fußleisten gründlich\n5. Türrahmen',
        timeMinutes: 25,
      ),
    ],
  ),

  Task(
    id: "hallway_organize_shoes",
    title: "Schuhe sortieren",
    category: TaskCategories.organize,
    relatedAreas: ["hallway"],
    relatedActivities: ["organizing"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schuhe grob zusammenstellen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Schuhe paaren\n2. Ins Regal',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Schuhe sortieren\n2. Paare bilden\n3. Ordentlich ins Regal',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Schuhe sortieren\n2. Putzen\n3. System im Regal\n4. Außer-Saison verstauen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Schuhe raus\n2. Putzen\n3. Ausmisten\n4. Schuhregal reinigen\n5. System einführen',
        timeMinutes: 25,
      ),
    ],
  ),

  Task(
    id: "hallway_declutter_coats",
    title: "Jacken aussortieren",
    category: TaskCategories.declutter,
    relatedAreas: ["hallway"],
    relatedActivities: ["decluttering"],
    cooldownDays: 90,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich alte Jacken raus',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Jacken durchsehen\n2. Ungetragene aussortieren',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Jacken checken\n2. Kaputte und Alte raus\n3. Spenden vorbereiten',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplett durchgehen\n2. Nach Jahreszeit sortieren\n3. Aussortieren\n4. Spende/Verkauf',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Jacken und Mäntel\n2. Anprobieren\n3. Radikal aussortieren\n4. Nur Getragenes behalten\n5. Rest spenden',
        timeMinutes: 30,
      ),
    ],
  ),

  // === STORAGE ===
  Task(
    id: "storage_organize_boxes",
    title: "Abstellraum sortieren",
    category: TaskCategories.organize,
    relatedAreas: ["storage"],
    relatedActivities: ["organizing", "sorting"],
    cooldownDays: 60,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Ein paar Kisten beschriften',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Kisten umsortieren\n2. Beschriften',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 3,
        description: '1. Kisten durchgehen\n2. Sortieren\n3. Alles beschriften',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Kompletten Raum durchgehen\n2. Kategorien bilden\n3. Kisten sortieren\n4. System einführen',
        timeMinutes: 35,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alles rausnehmen\n2. Kategorisieren\n3. Ausmisten\n4. Perfektes System\n5. Beschriften und einräumen',
        timeMinutes: 90,
      ),
    ],
  ),

  Task(
    id: "storage_declutter_old_stuff",
    title: "Altes Zeug entsorgen",
    category: TaskCategories.declutter,
    relatedAreas: ["storage"],
    relatedActivities: ["decluttering"],
    cooldownDays: 90,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich Kaputtes raus',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Alte Sachen finden\n2. Entsorgen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Kisten durchgehen\n2. Unbrauchbares aussortieren\n3. Entsorgen',
        timeMinutes: 25,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Kompletten Raum checken\n2. Alles bewerten\n3. Radikal aussortieren\n4. Sperrmüll organisieren',
        timeMinutes: 45,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Jede Kiste leeren\n2. Konmari-Methode\n3. Verkaufen/Spenden/Entsorgen\n4. Nur Wichtiges zurück\n5. Perfekt organisieren',
        timeMinutes: 120,
      ),
    ],
  ),

  // === BALCONY ===
  Task(
    id: "balcony_clean_floor",
    title: "Balkon fegen",
    category: TaskCategories.cleaning,
    relatedAreas: ["balcony"],
    relatedActivities: ["cleaning", "sweeping"],
    cooldownDays: 14,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell über den Boden fegen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Boden fegen\n2. Grobe Verschmutzungen weg',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Kompletten Boden fegen\n2. Ecken auch\n3. Abfluss reinigen',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Fegen\n2. Boden wischen\n3. Balkonmöbel abwischen\n4. Pflanzen gießen',
        timeMinutes: 18,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alles frei räumen\n2. Fegen und wischen\n3. Möbel reinigen\n4. Pflanzen pflegen\n5. Balkongeländer putzen',
        timeMinutes: 35,
      ),
    ],
  ),

  Task(
    id: "balcony_organize_furniture",
    title: "Balkonmöbel arrangieren",
    category: TaskCategories.organize,
    relatedAreas: ["balcony"],
    relatedActivities: ["organizing"],
    cooldownDays: 30,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Stühle zusammenstellen',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Möbel sortieren\n2. Schön arrangieren',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Möbel umstellen\n2. Pflanzen arrangieren\n3. Deko platzieren',
        timeMinutes: 12,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Komplette Neuanordnung\n2. Sitzgruppe optimal\n3. Pflanzen schön verteilen\n4. Lichterketten',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alles neu gestalten\n2. Möbel umstellen\n3. Pflanzen umtopfen\n4. Deko neu arrangieren\n5. Gemütliche Atmosphäre',
        timeMinutes: 45,
      ),
    ],
  ),

  Task(
    id: "balcony_declutter_items",
    title: "Balkon ausmisten",
    category: TaskCategories.declutter,
    relatedAreas: ["balcony"],
    relatedActivities: ["decluttering"],
    cooldownDays: 90,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Offensichtlich Kaputtes raus',
        timeMinutes: 3,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Alte Pflanzen entsorgen\n2. Kaputtes wegwerfen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alles durchgehen\n2. Kaputtes und Unnötiges\n3. Entsorgen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Kompletten Balkon checken\n2. Alte Möbel aussortieren\n3. Tote Pflanzen entsorgen\n4. Nur Brauchbares behalten',
        timeMinutes: 25,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Balkon komplett leeren\n2. Alles bewerten\n3. Radikal aussortieren\n4. Möbel reparieren/entsorgen\n5. Nur Schönes zurück',
        timeMinutes: 60,
      ),
    ],
  ),

  // === GENERELLE TASKS FÜR ACTIVITIES ===
  Task(
    id: "general_dusting",
    title: "Staub wischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["living", "bedroom", "office", "hallway"],
    relatedActivities: ["cleaning", "dusting"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Schnell über 2-3 Oberflächen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Hauptflächen abstauben\n2. Sichtbare Bereiche',
        timeMinutes: 8,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle sichtbaren Flächen\n2. Fensterbank\n3. Regale kurz',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alle Oberflächen gründlich\n2. Fensterbank\n3. Regale\n4. Bilderrahmen und Deko',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Kompletten Raum abstauben\n2. Auch schwer erreichbare\n3. Lampen\n4. Deko gründlich\n5. Hinter Möbeln',
        timeMinutes: 35,
      ),
    ],
  ),

  Task(
    id: "general_trash_disposal",
    title: "Müll entsorgen",
    category: TaskCategories.declutter,
    relatedAreas: ["kitchen", "bath", "bedroom", "office"],
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
        description: '1. Hauptmülleimer leeren\n2. Neuen Beutel',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 3,
        description:
            '1. Alle Mülleimer im Raum\n2. Neue Beutel\n3. Altpapier sammeln',
        timeMinutes: 10,
      ),
      TaskVariant(
        energyLevel: 4,
        description:
            '1. Alle Mülleimer leeren\n2. Neue Beutel\n3. Müll rausbringen\n4. Pfandflaschen',
        timeMinutes: 15,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Alle Mülleimer im Haushalt\n2. Müll rausbringen\n3. Mülltrennung checken\n4. Pfand wegbringen\n5. Eimer auswischen',
        timeMinutes: 25,
      ),
    ],
  ),

  Task(
    id: "general_laundry",
    title: "Wäsche waschen",
    category: TaskCategories.cleaning,
    relatedAreas: ["bath", "bedroom", "laundry"],
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
            '1. Alle Wäschekörbe\n2. Nach Farben sortieren\n3. 2 Maschinen durchlaufen\n4. Wäsche zusammenlegen und wegräumen\n5. Wäscheständer reinigen',
        timeMinutes: 60,
      ),
    ],
  ),

  Task(
    id: "general_floor_mopping",
    title: "Boden wischen",
    category: TaskCategories.cleaning,
    relatedAreas: ["kitchen", "bath", "hallway"],
    relatedActivities: ["mopping", "cleaning"],
    cooldownDays: 7,
    variants: [
      TaskVariant(
        energyLevel: 1,
        description: 'Nur schmutzigste Stellen',
        timeMinutes: 5,
      ),
      TaskVariant(
        energyLevel: 2,
        description: '1. Hauptfläche kurz durchwischen\n2. Sichtbare Flecken',
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
            '1. Boden komplett frei\n2. Gründlich wischen\n3. Auch unter Möbeln\n4. Ecken und Übergänge',
        timeMinutes: 20,
      ),
      TaskVariant(
        energyLevel: 5,
        description:
            '1. Boden komplett frei\n2. Erstmal fegen/saugen\n3. Sehr gründlich wischen\n4. Alle Ecken\n5. Fußleisten auch',
        timeMinutes: 35,
      ),
    ],
  ),
];
