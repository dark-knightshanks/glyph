#pragma once
#include <string>
#include <vector>
#include <unordered_map>
#include "token.h"

namespace tensorscript {
    class Lexer{
    public:
        explicit Lexer(std::string source);
        Token nexttoken();
    private:
        std::string source;
        size_t start = 0;
        size_t current = 0;
        int line = 1;
        int col = 1;

        std::unordered_map<std::string, Tokentype> keywords;

        bool isAtend() const;
        char advance();
        char peek() const;
        char peeknext() const;
    };
}
