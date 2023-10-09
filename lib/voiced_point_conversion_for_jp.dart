library voiced_point_conversion_for_jp;

/// 個のライブラリ内で発生した例外をこのクラスで投げます
class VoicedPointException implements Exception {
  final String message;

  VoicedPointException(this.message);

  @override
  String toString() => 'VoicedPointException: $message';
}

/// 清音を濁音、半濁音、小書きに変換するライブラリクラスです
class VoicedPointConv4JP {
  /// 濁音リスト
  static Map<String, String> voicedPointTable = {
    'う': 'ゔ',
    'か': 'が',
    'き': 'ぎ',
    'く': 'ぐ',
    'け': 'げ',
    'こ': 'ご',
    'さ': 'ざ',
    'し': 'じ',
    'す': 'ず',
    'せ': 'ぜ',
    'そ': 'ぞ',
    'た': 'だ',
    'ち': 'ぢ',
    'つ': 'づ',
    'て': 'で',
    'と': 'ど',
    'は': 'ば',
    'ひ': 'び',
    'ふ': 'ぶ',
    'へ': 'べ',
    'ほ': 'ぼ',
    'ウ': 'ヴ',
    'カ': 'ガ',
    'キ': 'ギ',
    'ク': 'グ',
    'ケ': 'ゲ',
    'コ': 'ゴ',
    'サ': 'ザ',
    'シ': 'ジ',
    'ス': 'ズ',
    'セ': 'ゼ',
    'ソ': 'ゾ',
    'タ': 'ダ',
    'チ': 'ヂ',
    'ツ': 'ヅ',
    'テ': 'デ',
    'ト': 'ド',
    'ハ': 'バ',
    'ヒ': 'ビ',
    'フ': 'ブ',
    'ヘ': 'ベ',
    'ホ': 'ボ',
    'ワ': 'ヷ',
    'ヰ': 'ヸ',
    'ヱ': 'ヹ',
    'ヲ': 'ヺ',
  };

  /// 半濁音リスト
  static Map<String, String> halfDullnessTable = {
    'は': 'ぱ',
    'ひ': 'ぴ',
    'ふ': 'ぷ',
    'へ': 'ぺ',
    'ほ': 'ぽ',
    'ハ': 'パ',
    'ヒ': 'ピ',
    'フ': 'プ',
    'ヘ': 'ペ',
    'ホ': 'ポ',
  };

  /// 小書きリスト
  static Map<String, String> smallWritingTable = {
    'あ': 'ぁ',
    'い': 'ぃ',
    'う': 'ぅ',
    'え': 'ぇ',
    'お': 'ぉ',
    'つ': 'っ',
    'や': 'ゃ',
    'ゆ': 'ゅ',
    'よ': 'ょ',
    'わ': 'ゎ',
    'ア': 'ァ',
    'イ': 'ィ',
    'ウ': 'ゥ',
    'エ': 'ェ',
    'オ': 'ォ',
    'カ': 'ヵ',
    'ク': 'ㇰ',
    'ケ': 'ヶ',
    'シ': 'ㇱ',
    'ス': 'ㇲ',
    'ツ': 'ッ',
    'ト': 'ㇳ',
    'ヌ': 'ㇴ',
    'ハ': 'ㇵ',
    'ヒ': 'ㇶ',
    'フ': 'ㇷ',
    'ヘ': 'ㇸ',
    'ホ': 'ㇹ',
    'ム': 'ㇺ',
    'ヤ': 'ャ',
    'ユ': 'ュ',
    'ヨ': 'ョ',
    'ラ': 'ㇻ',
    'リ': 'ㇼ',
    'ル': 'ㇽ',
    'レ': 'ㇾ',
    'ロ': 'ㇿ',
    'ワ': 'ヮ',
  };

  /// 入力チェック
  static validation(var input) {
    if (input == null) {
      throw VoicedPointException("input value is null.");
    } else if (input is! String) {
      throw VoicedPointException(
          "input type is not String.(${input.runtimeType})");
    }
  }

  /// 変換共通処理
  static String convert(Map<String, String> table, String input) {
    validation(input);
    try {
      StringBuffer output = StringBuffer();
      for (int i = 0; i < input.length; i++) {
        String char = input[i];
        if (table.containsKey(char)) {
          output.write(table[char]);
        } else {
          output.write(char);
        }
      }
      return output.toString();
    } catch (e) {
      throw VoicedPointException(e.toString());
    }
  }

  /// 清音を濁音に変換する(例：か -> が)
  static String convertToVoicedPoint(String input) {
    return convert(voicedPointTable, input);
  }

  /// 清音を半濁音に変換する(例：は -> ぱ)
  static String convertToHalfDullness(String input) {
    return convert(halfDullnessTable, input);
  }

  // 清音を小書きに変換する(例：あ -> ぁ)
  static String convertToSmallWriting(String input) {
    return convert(smallWritingTable, input);
  }
}
