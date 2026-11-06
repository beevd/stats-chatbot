// Stats chatbot - beevd style.
// Applied statistics (pasias) + product chatbot (commun):
// answer a stats question in plain language.
// Usage: dart persona_beevd_stats_chatbot.dart 2 4 4 5 9
import 'dart:math';
void main(List<String> args) {
  var nums = args.map(double.parse).toList();
  if (nums.isEmpty) nums = [2, 4, 4, 5, 9];
  nums.sort();
  var mean = nums.reduce((a, b) => a + b) / nums.length;
  var median = nums.length.isOdd
      ? nums[nums.length ~/ 2]
      : (nums[nums.length ~/ 2 - 1] + nums[nums.length ~/ 2]) / 2;
  var variance = nums.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / nums.length;
  print('Q: what do these numbers say? $nums');
  print('A: mean=$mean, median=$median, stddev=${sqrt(variance).toStringAsFixed(2)}.');
  print(mean > median ? 'A: skewed high - a few big values pull the mean up.' : 'A: fairly balanced around the middle.');
}
