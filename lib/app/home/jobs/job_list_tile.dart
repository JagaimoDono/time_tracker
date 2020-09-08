import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/home/models/job.dart';

class JobListTile extends StatelessWidget {
  JobListTile({Key key, @required this.job, @required this.onTap});

  final Job job;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(job.name),
      onTap: onTap,
      trailing: Icon(Icons.chevron_right),
    );
  }
}
