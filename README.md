# voiced_point_conversion_for_jp
日本語のひらがな、かたかなを濁点や丸が付いたものに変換するライブラリです。例えば「は」を「ば」や「ぱ」に変換します。

# 使い方
```
String str1 = VoicedPointConv4JP.convertToVoicedPoint('か');
print(str1); // が

String str2 = VoicedPointConv4JP.convertToHalfDullness('は');
print(str2); // ぱ

String str3 = VoicedPointConv4JP.convertToSmallWriting('や');
print(str3); // ゃ
```

※複数文字の場合、すべての文字を変換しますが、一文字ずつを推奨します。
