class ExperienceModel {
  final String id;
  final String title;
  final String company;
  final String duration;
  final String description;
  final List<String> technologies;

  ExperienceModel({
    required this.id,
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
    required this.technologies,
  });

  ExperienceModel copyWith({
    String? id,
    String? title,
    String? company,
    String? duration,
    String? description,
    List<String>? technologies,
  }) {
    return ExperienceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'duration': duration,
      'description': description,
      'technologies': technologies,
    };
  }

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      duration: json['duration'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
    );
  }
}
