void main() {
  String word = "Flutter"; 
  int vowelCount = 0;      

  List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'y'];

  for (int i = 0; i < word.length; i++) {
    String char = word[i].toLowerCase(); 
    if (vowels.contains(char)) {         
      vowelCount++;                      
    }
  }

  print("Слово: $word");
  print("Гласных букв: $vowelCount");
}