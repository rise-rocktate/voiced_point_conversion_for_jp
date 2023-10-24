library voiced_point_conversion_for_jp;

/// このライブラリ内で発生した例外をこのクラスで投げます
class VoicedPointException implements Exception {
  final String message;

  VoicedPointException(this.message);

  @override
  String toString() => 'VoicedPointException: $message';
}

/// 変換タイプの列挙型
enum ConvType {
  /// 濁音変換
  voicedPoint,

  /// 半濁音変換
  halfDullness,

  /// 小書き変換
  smallWriting,
}

/// 日本語の清音を濁音、半濁音、小書きに変換するライブラリクラスです
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

  static Map<String, String> toggleTable = {
    'あ': 'ぁ',
    'ぁ': 'あ',
    'い': 'ぃ',
    'ぃ': 'い',
    'う': 'ゔ',
    'ゔ': 'ぅ',
    'ぅ': 'う',
    'え': 'ぇ',
    'ぇ': 'え',
    'お': 'ぉ',
    'ぉ': 'お',
    'か': 'が',
    'が': 'か',
    'き': 'ぎ',
    'ぎ': 'き',
    'く': 'ぐ',
    'ぐ': 'く',
    'け': 'げ',
    'げ': 'け',
    'こ': 'ご',
    'ご': 'こ',
    'さ': 'ざ',
    'ざ': 'さ',
    'し': 'じ',
    'じ': 'し',
    'す': 'ず',
    'ず': 'す',
    'せ': 'ぜ',
    'ぜ': 'せ',
    'そ': 'ぞ',
    'ぞ': 'そ',
    'た': 'だ',
    'だ': 'た',
    'ち': 'ぢ',
    'ぢ': 'ち',
    'つ': 'づ',
    'づ': 'っ',
    'っ': 'つ',
    'て': 'で',
    'で': 'て',
    'と': 'ど',
    'ど': 'と',
    'は': 'ば',
    'ば': 'ぱ',
    'ぱ': 'は',
    'ひ': 'び',
    'び': 'ぴ',
    'ぴ': 'ひ',
    'ふ': 'ぶ',
    'ぶ': 'ぷ',
    'ぷ': 'ふ',
    'へ': 'べ',
    'べ': 'ぺ',
    'ぺ': 'へ',
    'ほ': 'ぼ',
    'ぼ': 'ぽ',
    'ぽ': 'ほ',
    'や': 'ゃ',
    'ゃ': 'や',
    'ゆ': 'ゅ',
    'ゅ': 'ゆ',
    'よ': 'ょ',
    'ょ': 'よ',
    'わ': 'ゎ',
    'ゎ': 'わ',
    'ア': 'ァ',
    'ァ': 'ア',
    'イ': 'ィ',
    'ィ': 'イ',
    'ウ': 'ヴ',
    'ヴ': 'ゥ',
    'ゥ': 'ウ',
    'エ': 'ェ',
    'ェ': 'エ',
    'オ': 'ォ',
    'ォ': 'オ',
    'カ': 'ガ',
    'ガ': 'ヵ',
    'ヵ': 'カ',
    'キ': 'ギ',
    'ギ': 'キ',
    'ク': 'グ',
    'グ': 'ㇰ',
    'ㇰ': 'ク',
    'ケ': 'ゲ',
    'ゲ': 'ヶ',
    'ヶ': 'ケ',
    'コ': 'ゴ',
    'ゴ': 'コ',
    'サ': 'ザ',
    'ザ': 'サ',
    'シ': 'ジ',
    'ジ': 'ㇱ',
    'ㇱ': 'シ',
    'ス': 'ズ',
    'ズ': 'ㇲ',
    'ㇲ': 'ス',
    'セ': 'ゼ',
    'ゼ': 'セ',
    'ソ': 'ゾ',
    'ゾ': 'ソ',
    'タ': 'ダ',
    'ダ': 'タ',
    'チ': 'ヂ',
    'ヂ': 'チ',
    'ツ': 'ヅ',
    'ヅ': 'ッ',
    'ッ': 'ツ',
    'テ': 'デ',
    'デ': 'テ',
    'ト': 'ド',
    'ド': 'ㇳ',
    'ㇳ': 'ト',
    'ハ': 'バ',
    'バ': 'パ',
    'パ': 'ㇵ',
    'ㇵ': 'ハ',
    'ヒ': 'ビ',
    'ビ': 'ピ',
    'ピ': 'ㇶ',
    'ㇶ': 'ヒ',
    'フ': 'ブ',
    'ブ': 'プ',
    'プ': 'ㇷ',
    'ㇷ': 'フ',
    'ヘ': 'ベ',
    'ベ': 'ペ',
    'ペ': 'ㇸ',
    'ㇸ': 'ヘ',
    'ホ': 'ボ',
    'ボ': 'ポ',
    'ポ': 'ㇹ',
    'ㇹ': 'ホ',
    'ヤ': 'ャ',
    'ャ': 'ヤ',
    'ユ': 'ュ',
    'ュ': 'ユ',
    'ヨ': 'ョ',
    'ョ': 'ヨ',
    'ラ': 'ㇻ',
    'ㇻ': 'ラ',
    'リ': 'ㇼ',
    'ㇼ': 'リ',
    'ル': 'ㇽ',
    'ㇽ': 'ル',
    'レ': 'ㇾ',
    'ㇾ': 'レ',
    'ロ': 'ㇿ',
    'ㇿ': 'ロ',
    'ワ': 'ヷ',
    'ヷ': 'ヮ',
    'ヮ': 'ワ',
    'ヰ': 'ヸ',
    'ヸ': 'ヰ',
    'ヱ': 'ヹ',
    'ヹ': 'ヱ',
    'ヲ': 'ヺ',
    'ヺ': 'ヲ',
    'ヌ': 'ㇴ',
    'ㇴ': 'ヌ',
    'ム': 'ㇺ',
    'ㇺ': 'ム',
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

  /// 清音を小書きに変換する(例：あ -> ぁ)
  static String convertToSmallWriting(String input) {
    return convert(smallWritingTable, input);
  }

  /// タイプでどんな変換をするか決めて変換する
  static String convertByType(ConvType type, String input) {
    String result;
    switch (type) {
      case ConvType.voicedPoint:
        result = convertToVoicedPoint(input);
        break;
      case ConvType.halfDullness:
        result = convertToHalfDullness(input);
        break;
      case ConvType.smallWriting:
        result = convertToSmallWriting(input);
        break;
      default:
        throw VoicedPointException("type is invalid.($type)");
    }
    return result;
  }

  /// トグル変換(例：は -> ば -> ぱ -> は)
  static String convertByToggle4last(String input) {
    if (input.isEmpty) {
      return '';
    }
    int last = input.length - 1;
    String lastStr = input.substring(last);
    return input.substring(0, last) + convert(toggleTable, lastStr);
  }
}
