enum APIPath { getWalkRecord2 }

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getWalkRecord2:
        return 'getWalkRecord2';
    }
  }
}
