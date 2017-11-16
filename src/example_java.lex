
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.*;

class MainClass {
    public static void main(String[] args) {
        FileReader fr = null;
        String input = "code.txt";
        try {
            fr = new FileReader(input);		
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        System.out.println("Lexeme\tToken\tAttribute");
        Yylex yylex = new Yylex(fr);
        try {
            yylex.yylex();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
  
%%

PROGRAM_KW = (\u0628\u0631\u0646\u0627\u0645\u0647)
type_kw = (\u0633\u0627\u062e\u062a\u0627\u0631)
constant_kw = (\u062b\u0627\u0628\u062a)
MAIN_KW = (\u0627\u0635\u0644\u068a)|(\u0627\u0635\u0644)

int_kw = (\u0635\u062d\u06cc\u062d)|(\u0635\u062d\u062d)
float_kw = (\u0627\u0639\u0634\u0627\u0631\u06cc)|(\u0627\u0639\u0634\u0627\u0631)
harf_kw = (\u062d\u0631\u0641)
boolean_kw = (\u0645\u0646\u0637\u0642\u06cc) | (\u0645\u0646\u0637\u0642)

switch_kw = (\u06a9\u0644\u06cc\u062f)
end_kw = (\u062a\u0645\u0627\u0645)
default_kw = (\u067e\u06cc\u0634\u0641\u0631\u0636)
break_kw = (\u0628\u0634\u06a9\u0646)
return_kw = (\u0628\u0631\u06af\u0631\u062f\u0627\u0646)

IF_KW = (\u0627\u06AF\u0631)
THEN_KW = (\u0622\u0646\u06af\u0627\u0647)
ELSE_KW = (\u0648\u06af\u0631\u0646\u0647)

AND_KW = (\u0648)
OR_KW = (\u06cc\u0627)
NOT_KW = (\u062e\u0644\u0627\u0641) 
while_kw = (\u0648\u0642\u062a\u06cc)|(\u0648\u0642\u062a)

PERSIAN_LETTER = [\u0600-\u06FF\uFB50-\uFDFF\uFE70-\uFEFF]	

NONZERO_DIGIT = [1-9]
DIGIT = "0"|{NONZERO_DIGIT}

harf_ragham = {DIGIT} | {PERSIAN_LETTER}

shenase = {PERSIAN_LETTER}{harf_ragham}*
adad = {DIGIT}+
back_slash = \
slash = (\u002f)
new_line = "\s"|"\n"|"\r"|"\t"
null_char = {back_slash}0
harfe_sabet = {back_slash}?"'"{back_slash}?(.){back_slash}?"'"{back_slash}?
noghte_virgul = ";"|[\u061b]
comma = ","|[\u060c]
comments = {slash}{slash}({PERSIAN_LETTER}|[A-z]|{DIGIT})*		{new_line} | {slash}"*"(.)*"*"{slash}

ADD_KW = [+]
SUB_KW = [-]

BOOLEAN_CONSTANT = (\u063a\u0644\u0637) | (\u062f\u0631\u0633\u062a)

%%
{comments} {
	//System.out.println(yytext() + "\t" + "comments\t" + '-');
	return YYParser.comments_kw;
}

{MAIN_KW} {
	//System.out.println(yytext() + "\t" + "MAIN_KW\t" + '-');
	return YYParser.MAIN_KW;
}

{SUB_KW} {
	//System.out.println(yytext() + "\t" + "SUB_KW\t" + '-');
	return YYParser.SUB_KW;
}

{ADD_KW} {
	//System.out.println(yytext() + "\t" + "ADD_KW\t" + '-');
	return YYParser.ADD_KW;
}

{BOOLEAN_CONSTANT} {
	//System.out.println(yytext() + "\t" + "BOOLEAN_CONSTANT\t" + '-');
	return YYParser.BOOLEAN_CONSTANT;
}

{int_kw} {
	//System.out.println(yytext() + "\t" + "int_kw\t" + '-');
	return YYParser.int_kw;
}
{float_kw} {
	//System.out.println(yytext() + "\t" + "float_kw\t" + '-');
	return YYParser.float_kw;
}
{harf_kw} {
	//System.out.println(yytext() + "\t" + "harf_kw\t" + '-');
	return YYParser.harf_kw;
}
{boolean_kw} {
	//System.out.println(yytext() + "\t" + "boolean_kw\t" + '-');
	return YYParser.boolean_kw;
}
{switch_kw} {
	//System.out.println(yytext() + "\t" + "switch_kw\t" + '-');
	return YYParser.switch_kw;
}
{end_kw} {
	//System.out.println(yytext() + "\t" + "end_kw\t" + '-');
	return YYParser.end_kw;
}
{default_kw} {
	//System.out.println(yytext() + "\t" + "default_kw\t" + '-');
	return YYParser.default_kw;
}
{break_kw} {
	//System.out.println(yytext() + "\t" + "break_kw\t" + '-');
	return YYParser.break_kw;
}
{return_kw} {
	//System.out.println(yytext() + "\t" + "return_kw\t" + '-');
	return YYParser.return_kw;
}

{comma} {
	//System.out.println(yytext() + "\t" + "comma\t" + '-');
	return YYParser.comma;
}

{PROGRAM_KW} {
	//System.out.println(yytext() + "\t" + "PROGRAM_KW\t" + '-');
	return YYParser.PROGRAM_KW;
}
{type_kw} {
	//System.out.println(yytext() + "\t" + "type_kw\t" + '-');
	return YYParser.type_kw;
}
{constant_kw} {
	//System.out.println(yytext() + "\t" + "constant_kw\t" + '-');
	return YYParser.constant_kw;
}

{IF_KW} {
	//System.out.println(yytext() + "\t" + "IF_KW\t" + '-');
	return YYParser.IF_KW;
}
{THEN_KW} {
	//System.out.println(yytext() + "\t" + "THEN_KW\t" + '-');
	return YYParser.THEN_KW;
}
{ELSE_KW} {
	//System.out.println(yytext() + "\t" + "ELSE_KW\t" + '-');
	return YYParser.ELSE_KW;
}
{AND_KW} {
	System.out.println(yytext() + "\t" + "AND_KW\t" + '-');
}
{OR_KW} {
	//System.out.println(yytext() + "\t" + "OR_KW\t" + '-');
	return YYParser.OR_KW;
}
{NOT_KW} {
	//System.out.println(yytext() + "\t" + "NOT_KW\t" + '-');
	return YYParser.NOT_KW;
}
{while_kw} {
	//System.out.println(yytext() + "\t" + "while_kw\t" + '-');
	return YYParser.while_kw;
}

{noghte_virgul} {
	//System.out.println(yytext() + "\t" + "noghte_virgul\t" + '-');
	return YYParser.noghte_virgul;
}

{adad} {
	//System.out.println(yytext() + "\t" + "adad\t" + '-');
	return YYParser.adad;
}

{shenase} {
	 
	//System.out.println(yytext() + "\t" + "shenase\t" + '-');
	return YYParser.shenase;
}

{harfe_sabet} {
	//System.out.println(yytext() + "\t" + "harfe_sabet\t" + '-');
	return YYParser.harfe_sabet;
}

{null_char} {
	//System.out.println(yytext() + "\t" + "null_char\t" + '-');
	return YYParser.null_char;
}
. {
	//System.out.println(yytext() + "\t" + "nothing\t" + '-');

}