// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Auth {
  ///유저 ID
  final String uid;

  ///토큰
  final String token;

  ///토큰 타입
  final String tokenType;

  /// 토큰 만료 시간
  final int expriresIn;

  /// 토큰 만료 기한한
  final int expriesAt;

  Auth({
    required this.uid,
    required this.token,
    required this.tokenType,
    required this.expriresIn,
    required this.expriesAt,
  });

  Auth copyWith({
    String? uid,
    String? token,
    String? tokenType,
    int? expriresIn,
    int? expriesAt,
  }) {
    return Auth(
      uid: uid ?? this.uid,
      token: token ?? this.token,
      tokenType: tokenType ?? this.tokenType,
      expriresIn: expriresIn ?? this.expriresIn,
      expriesAt: expriesAt ?? this.expriesAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': uid,
      'access_token': token,
      'token_type': tokenType,
      'expires_in': expriresIn,
      'expires_at': expriesAt,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      uid: map['user_id'] as String,
      token: map['access_token'] as String,
      tokenType: map['token_type'] as String,
      expriresIn: map['expires_in'] as int,
      expriesAt: map['expires_at'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Auth(uid: $uid, token: $token, tokenType: $tokenType, expriresIn: $expriresIn, expriesAt: $expriesAt)';
  }

  @override
  bool operator ==(covariant Auth other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.token == token &&
        other.tokenType == tokenType &&
        other.expriresIn == expriresIn &&
        other.expriesAt == expriesAt;
  }
}
