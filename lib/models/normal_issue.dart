class NormalIssue {
  const NormalIssue({
    this.key,
    this.iconPath,
    this.summary,
    this.id,
    this.originalTaskId,
  });

  final String key;
  final String iconPath;
  final String summary;
  final int originalTaskId;
  final int id;

  @override
  String toString() {
    return 'Issues(id: $id, key: $key)';
  }
}
