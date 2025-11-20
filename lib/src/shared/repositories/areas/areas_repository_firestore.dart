import 'package:bd_app_v0/src/shared/domain/area.dart';
import 'package:bd_app_v0/src/shared/repositories/areas/areas_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AreasRepositoryFirestore implements AreasRepository {
  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  AreasRepositoryFirestore({FirebaseFirestore? db, FirebaseAuth? auth})
    : _db = db ?? FirebaseFirestore.instance,
      _auth = auth ?? FirebaseAuth.instance;

  String get _currentUserId {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('No user logged in');
    return uid;
  }

  DocumentReference<Map<String, dynamic>> get _userRef =>
      _db.collection('users').doc(_currentUserId);

  CollectionReference<Map<String, dynamic>> get _userAreasCollection =>
      _userRef.collection('areas');

  Area _fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) throw Exception('Keine Räume gefunden');
    final name = (data['name'] as String?) ?? '';
    final isActive = (data['isActive'] as bool?) ?? true;
    final imageKey = (data['imageKey'] as String?) ?? 'placeholder';
    return Area(id: doc.id, name: name, isActive: isActive, imageKey: imageKey);
  }

  Future<List<Area>> _readAreasCatalog() async {
    final areasCatalog = await _db.collection('areas_catalog').get();
    return areasCatalog.docs
        .map((document) {
          final data = document.data();
          final name = (data['name'] as String?)?.trim();
          final imageKey = data['imageKey'] as String;
          if (name == null || name.isEmpty) {
            throw StateError(
              'areas_catalog/${document.id} has no correkt "name"',
            );
          }
          return Area(
            id: document.id,
            name: name,
            isActive: true,
            imageKey: imageKey,
          );
        })
        .toList(growable: false);
  }

  @override
  Future<List<Area>> getAllAreas() async {
    return _readAreasCatalog();
  }

  @override
  Future<List<Area>> getActiveAreas() async {
    final userAreasFromFirestore = await _userAreasCollection
        .where('isActive', isEqualTo: true)
        .orderBy('name')
        .get();
    if (userAreasFromFirestore.docs.isEmpty) {
      throw Exception('Keine aktiven Räume vorhanden');
    }
    return userAreasFromFirestore.docs.map(_fromDoc).toList(growable: false);
  }

  @override
  Future<Area> getAreaById(String id) async {
    final allAreas = await getAllAreas();
    final index = allAreas.indexWhere((area) => area.id == id);
    if (index < 0) throw Exception('Area not found');
    return allAreas[index];
  }

  @override
  Future<void> setAreaStatus(String id, bool isActive) async {
    final currentArea = _userAreasCollection.doc(id);

    final snap = await currentArea.get();
    if (!snap.exists) throw Exception('Area not found');

    final area = (snap.data()?['isActive'] as bool?);
    if (area != null && area == isActive) return;

    await currentArea.update({
      'isActive': isActive,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
