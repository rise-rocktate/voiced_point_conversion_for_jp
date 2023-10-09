import 'package:flutter_test/flutter_test.dart';

import 'package:voiced_point_conversion_for_jp/voiced_point_conversion_for_jp.dart';

void main() {
  test('変換処理簡易確認テスト', () {
    // 清音 => 清音
    expect(VoicedPointConv4JP.convertToVoicedPoint('あ'), 'あ');
    // 清音 => 濁音
    expect(VoicedPointConv4JP.convertToVoicedPoint('か'), 'が');
    expect(VoicedPointConv4JP.convertToVoicedPoint('き'), 'ぎ');
    expect(VoicedPointConv4JP.convertToVoicedPoint('く'), 'ぐ');
    expect(VoicedPointConv4JP.convertToVoicedPoint('け'), 'げ');
    expect(VoicedPointConv4JP.convertToVoicedPoint('こ'), 'ご');
    // 清音 => 半濁音
    expect(VoicedPointConv4JP.convertToHalfDullness('は'), 'ぱ');
    expect(VoicedPointConv4JP.convertToHalfDullness('ひ'), 'ぴ');
    expect(VoicedPointConv4JP.convertToHalfDullness('ふ'), 'ぷ');
    expect(VoicedPointConv4JP.convertToHalfDullness('へ'), 'ぺ');
    expect(VoicedPointConv4JP.convertToHalfDullness('ほ'), 'ぽ');
    // 清音 => 小書き
    expect(VoicedPointConv4JP.convertToSmallWriting('や'), 'ゃ');
    expect(VoicedPointConv4JP.convertToSmallWriting('ゆ'), 'ゅ');
    expect(VoicedPointConv4JP.convertToSmallWriting('よ'), 'ょ');
  });
}
