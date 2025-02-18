#include <fstream>
#include <iostream>
#include <optional>
#include <sstream>
#include <vector>

using namespace std;
enum class TokenType {
  _return,
  _int,
  semi

};
class Token {
public:
  TokenType type;
  int value;
  friend ostream &operator<<(ostream &out, const Token &t);
};
ostream &operator<<(ostream &out, const Token &t) {
  switch (t.type) {
  case TokenType::_return:
    out << "RETURN";
    break;
  case TokenType::_int:
    out << "INT" << " " << t.value;
    break;
  case TokenType::semi:
    out << "SEMICOLON";
    break;
  }
  return out;
}
int atoi(char c) { return c - '0'; }

vector<Token> tokenize(string &str) {
  string buff = "";
  int numval = 0;
  vector<Token> tokens;
  for (int i = 0; i < str.length(); i++) {
    char c = str.at(i);
    if (isalpha(c)) {
      buff.push_back(c);
      i++;
      while (isalnum(str.at(i))) {
        buff.push_back(str.at(i));
        i++;
      }
      i--;
      if (buff == "exit") {
        tokens.push_back({.type = TokenType::_return});
        buff.clear();
      } else {
        cerr << "You messed up !" << endl;
      }
    } else if (isdigit(c)) {
      buff.push_back(c);
      i++;
      while (isdigit(str.at(i))) {
        buff.push_back(str.at(i));
        i++;
      }
      i--;
      int n = 0;
      for (int i = 0; i < buff.size(); i++) {
        n = (10 * n) + (atoi(buff[i]));
      }
      tokens.push_back({.type = TokenType::_int, .value = n});
      buff.clear();

    } else if (c == ';') {
      tokens.push_back({.type = TokenType::semi});
    }

    else if (isspace(c)) {
      continue;
    }
  }
  return tokens;
}
int main(int argc, char *argv[]) {
  if (argc != 2) {
    std::cerr << "Incorrect usage , Correct usage is.." << endl;
    std::cerr << "mat <input.mat>" << endl;
    return 1;
  }
  string contents;

  stringstream contents_stream;
  fstream input(argv[1], ios::in);
  contents_stream << input.rdbuf();
  contents = contents_stream.str();
  vector<Token> thing = tokenize(contents);
  for (int i = 0; i < thing.size(); i++) {
    cout << thing[i] << endl;
  }
  return 0;
}
