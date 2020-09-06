import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter/app/home/models/job.dart';
import 'package:time_tracker_flutter/services/api_path.dart';
import 'package:time_tracker_flutter/services/firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> createJob(Job job) async =>
      await _service.setData(path: APIPath.job(uid, 'job_1238'), data: job.toMap());

  Stream<List<Job>> jobStream() {
    return _service.collectionStream(path: APIPath.jobs(uid), builder: (data) => Job.fromMap(data));
  }
}
