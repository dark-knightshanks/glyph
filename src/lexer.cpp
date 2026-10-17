#include "lexer.h"

namespace tensorscript{

    Lexer::Lexer(std::string source) : source(std::move(source)) {
        keywords["input"] = Tokentype::INPUT;
        keywords["return"] = Tokentype::RETURN;
        keywords["matmul"] = Tokentype::MATMUL;
    }
    bool Lexer::isAtend() const {
        return current >= source.length();
    }
    char Lexer::advance() {
        char c = source[current++];
        col++;
        if(c == '\n'){
            line++;
            col = 1;
        }
        return c;
    }
    char Lexer::peek() const {
        if(isAtend()){return '\0';}
        return source[current];
    }
    char Lexer::peeknext() const {
        if(current + 1 >= source.length()) {return '\0';}
        return source[current + 1];
    }
    Token Lexer::nexttoken() {
        // Skip whitespace and comments
        while (!isAtend()) {
            char c = peek();
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') {
                advance();
            } else if (c == '/' && peeknext() == '/') {
                // Skip line comment
                while (peek() != '\n' && !isAtend()) {
                    advance();
                }
            } else {
                break;
            }
        }

        // End of file check
        if (isAtend()) {
            return Token{Tokentype::TOK_EOF, "", line, col};
        }

        int startline = line;
        int startcol = col;
        size_t startpos = current;
        char c = advance();

        switch (c) {
            case '=': return Token{Tokentype::EQUAL, "=", startline, startcol};
            case '+': return Token{Tokentype::ADD, "+", startline, startcol};
            case '-': return Token{Tokentype::SUB, "-", startline, startcol};
            case '*': return Token{Tokentype::MUL, "*", startline, startcol};
            case '(': return Token{Tokentype::L_PAREN, "(", startline, startcol};
            case ')': return Token{Tokentype::R_PAREN, ")", startline, startcol};
            case ',': return Token{Tokentype::COMMA, ",", startline, startcol};
        }
        if (isalpha(c) || c == '_') {
            while (isalnum(peek()) || peek() == '_') {
                advance();
            }
            std::string text = source.substr(startpos, current - startpos);
            Tokentype tokentype = Tokentype::IDENTIFIER;
            auto it = keywords.find(text);
            if (it != keywords.end()) {
                tokentype = it->second;
            }
            return Token{tokentype, text, startline, startcol};
        }

        if (isdigit(c)) {
            // Consume any remaining digits before 'x'
            while (isdigit(peek())) {
                advance();
            }

            // Check if this is a shape literal like 4x4 or 128x64
            if (peek() == 'x' && isdigit(peeknext())) {
                advance(); // consume 'x'
                while (isdigit(peek())) {
                    advance(); // consume digits after 'x'
                }

                std::string text = source.substr(startpos, current - startpos);

                // Parse the dimensions around 'x'
                size_t xPos = text.find('x');
                int64_t dim0 = std::stoll(text.substr(0, xPos));
                int64_t dim1 = std::stoll(text.substr(xPos + 1));
                std::vector<int64_t> dims = {dim0, dim1};

                return Token{Tokentype::SHAPE, text, startline, startcol, 0.0, dims};
            }

            // Regular number
            std::string text = source.substr(startpos, current - startpos);
            double val = std::stod(text);
            return Token{Tokentype::NUM, text, startline, startcol, val};
        }

        // Unrecognized character
        return Token{Tokentype::ERROR, std::string(1, c), startline, startcol};
    }

}
