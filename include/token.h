#pragma once
#include <cstdint>
#include <vector>
#include <string>
#include <cctype>

namespace tensorscript {
    enum Tokentype {
        INPUT, // keywords
        RETURN,
        MATMUL,

        IDENTIFIER, //variables 
        NUM,
        SHAPE,

        ADD,
        SUB,
        MUL,
        EQUAL,
        L_PAREN,
        R_PAREN,
        COMMA,
        TOK_EOF,
        ERROR
    };

struct Token{
    Tokentype type;
    std::string lexeme;// substrings from the source file
    int line; // line and col for error handling
    int col;

    double val = 0.0f; // numerical value 
    std::vector<int64_t> dims; // dimension of the tensor
};
// Helpful for debugging: print token type as a string                                                                                      
const char* tokenTypeToString(Tokentype type);

}

