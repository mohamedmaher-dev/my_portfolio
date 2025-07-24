class ProjectModel {
  final String id;
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final String category;
  final bool featured;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    required this.category,
    this.featured = false,
  });

  ProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? technologies,
    String? imageUrl,
    String? githubUrl,
    String? liveUrl,
    String? category,
    bool? featured,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      imageUrl: imageUrl ?? this.imageUrl,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      category: category ?? this.category,
      featured: featured ?? this.featured,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'technologies': technologies,
      'imageUrl': imageUrl,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'category': category,
      'featured': featured,
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      imageUrl: json['imageUrl'],
      githubUrl: json['githubUrl'],
      liveUrl: json['liveUrl'],
      category: json['category'],
      featured: json['featured'] ?? false,
    );
  }
}
