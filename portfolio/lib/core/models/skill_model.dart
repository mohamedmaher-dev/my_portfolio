class SkillModel {
  final String name;
  final String category;
  final int proficiency; // 0-100
  final String icon;
  final String color; // Hex color string

  SkillModel({
    required this.name,
    required this.category,
    required this.proficiency,
    required this.icon,
    required this.color,
  });

  SkillModel copyWith({
    String? name,
    String? category,
    int? proficiency,
    String? icon,
    String? color,
  }) {
    return SkillModel(
      name: name ?? this.name,
      category: category ?? this.category,
      proficiency: proficiency ?? this.proficiency,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'proficiency': proficiency,
      'icon': icon,
      'color': color,
    };
  }

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      category: json['category'],
      proficiency: json['proficiency'],
      icon: json['icon'],
      color: json['color'],
    );
  }
}
