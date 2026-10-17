#include <iostream>
#include "token.h"
#include "lexer.h"
using namespace tensorscript;

int main (){
    std::string source = " a = input(4x4)\nreturn a";
    Lexer lex(source);
    Token tok = lex.nexttoken();
    while(tok.type != Tokentype::TOK_EOF){
        std::cout << "Lexeme: " << tok.lexeme << "\n";
        std::cout << "Line: " << tok.line << "\n";
        std::cout << "Col: " << tok.col << "\n";
        std::cout << "Type: " << tok.type << "\n";
        tok = lex.nexttoken();
    }
    return 0 ;

}
