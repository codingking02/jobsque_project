class FilterJob {
  final int id;
  final String name;
  final String image;
  final String job_time_type;
  final String job_type;
  final String salary;
  final String comp_name;
  final String location;
  // ... other fields

  FilterJob({
    required this.id,
    required this.name,
    required this.image,
    required this.job_time_type,
    required this.job_type,
    required this.comp_name,
    required this.location,
    required this.salary,
    // ... other fields
  });

  factory FilterJob.fromJson(Map<String, dynamic> json) {
    return FilterJob(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      job_time_type: json['job_time_type'],
      job_type: json['job_type'],
      comp_name: json['comp_name'],
      location: json['location'],
      salary: json['salary'],
      // ... initialize other fields similarly
    );
  }
}
