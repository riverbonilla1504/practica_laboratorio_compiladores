import sys
import os

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from antlr4 import *
from antlr4.error.ErrorListener import ConsoleErrorListener
from parser.grammar.DevOpsDSLLexer import DevOpsDSLLexer
from parser.grammar.DevOpsDSLParser import DevOpsDSLParser


def main():
    print("[INFO] Iniciando validacion del DSL...\n")

    # Permitir pasar archivo por argumento
    file = "script.dsl"
    if len(sys.argv) > 1:
        file = sys.argv[1]

    # Validar que el archivo existe
    if not os.path.exists(file):
        print(f"[ERROR] No existe el archivo: {file}")
        return

    # Cargar archivo DSL
    input_stream = FileStream(file)

    # Fase lexica
    lexer = DevOpsDSLLexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    token_stream.fill()

    # Se usa tambien para obtener nombres de token robustos.
    parser = DevOpsDSLParser(token_stream)

    print("[INFO] TOKENS GENERADOS POR EL LEXER")
    print("=" * 70)
    print(f"{'#':<4}{'TIPO':<18}{'LINEA':<8}{'COLUMNA':<10}LEXEMA")
    print("-" * 70)

    for idx, tok in enumerate(token_stream.tokens):
        if tok.type == Token.EOF:
            token_type = "EOF"
        else:
            token_type = "UNKNOWN"

            if tok.type < len(parser.symbolicNames):
                symbolic = parser.symbolicNames[tok.type]
                if symbolic and symbolic != "<INVALID>":
                    token_type = symbolic

            if token_type == "UNKNOWN" and tok.type < len(parser.literalNames):
                literal = parser.literalNames[tok.type]
                if literal and literal != "<INVALID>":
                    token_type = literal

        lexeme = tok.text.replace("\n", "\\n") if tok.text else ""
        print(f"{idx:<4}{token_type:<18}{tok.line:<8}{tok.column:<10}{lexeme}")

    print("\n[INFO] Total de tokens (incluyendo EOF):", len(token_stream.tokens), "\n")

    # Fase sintactica

    parser.removeErrorListeners()
    parser.addErrorListener(ConsoleErrorListener())

    tree = parser.program()

    print("[INFO] ARBOL SINTACTICO GENERADO POR EL PARSER")
    print("=" * 70)
    print(tree.toStringTree(recog=parser))
    print("\n[INFO] Validacion lexica y sintactica completada.")
    print("[INFO] Puede continuar con la fase de interpretacion/ejecucion.\n")


if __name__ == "__main__":
    main()