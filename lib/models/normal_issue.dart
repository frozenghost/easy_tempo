class NormalIssue {
  const NormalIssue({
    this.key,
    this.iconPath,
    this.summary,
    this.id,
  });

  final String key;
  final String iconPath;
  final String summary;
  final int id;

  @override
  String toString() {
    return 'Issues(id: $id, key: $key)';
  }
}
