%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
int flag=0;
%}

%token SOUT NUMBER STR EXP PALINDROME ADD SUB MUL DIV REVERSE PRIME SOD

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

/* Rule Section */

%%

input:   { printf(">> ");}
            |  input line ask
line: NUMBER SOUT { printf("%d\n",$1);}
    | STR SOUT  {  printf("%s\n",$1);
                    // char str[strlen($1)];
                    // strcpy(str,$1); 
                    // substr(str,1,strlen($1)-2);
                }
    |  NUMBER NUMBER ADD   { printf("%d\n", $1 + $2); }
    |  NUMBER NUMBER SUB   { printf("%d\n", $1 - $2); }
    |  NUMBER NUMBER MUL   { printf("%d\n", $1 * $2); }
    |  NUMBER NUMBER DIV   { printf("%lf\n", $1 / $2); }
    |  NUMBER NUMBER EXP   {printf("%lf\n",pow($1,$2));}
    |  NUMBER REVERSE   { printf("%d\n",reverse($1));}
    |  NUMBER PRIME   {isPrime($1);}
    |  NUMBER SOD   {sum_of_digits($1);}
    |  STR REVERSE  { 
                char str[strlen($1)];
                strcpy(str,$1);
                reverse_string(str);
                free($1);
             }
    |  STR PALINDROME  { 
                char str[strlen($1)];
                strcpy(str,$1);
                isPalindrome(str);
                free($1);
             }
    ;
ask : { printf(">> ");}
%%
int main(void) {
    while (1) {
        yyparse();
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int reverse(int num) {
    int rev = 0, rem;
    while (num != 0) {
        rem = num % 10;
        rev = rev * 10 + rem;
        num /= 10;
    }
    return rev;
}


void isPalindrome(char str[]) {
   int i, len, fg = 0;
   len = strlen(str);
   for(i=0;i<len;i++) 
      if(str[i] != str[len-i-1]) {
         fg = 1;
         break;
      }
   if (fg)
    printf("not palindrom\n");
   else 
    printf("is palindrom\n");
}
void reverse_string(char str[]) {
    int len = strlen(str);
    for (int i = 0; i < len/2; i++) {
        char temp = str[i];
        str[i] = str[len-i-1];
        str[len-i-1] = temp;
    }
    printf("%s\n",str);
}


void isPrime(int n){
    int i;
    int x=n/2;
    int fg=0;
    for(i = 2; i < x; i++) {
        if(n % i == 0) {
            printf("%d is not prime\n",n );
            fg=1;
            break;
        }
    }
    if(fg==0){
        printf("%d is prime\n",n );
    }
}

void sum_of_digits(int num) {
    int sum = 0;
    while(num > 0) {
        sum += num % 10;
        num /= 10;
    }
    printf("%d\n",sum );
}

void substr(char *string, int start, int length) {
    char sub[length + 1];
    strncpy(sub, string + start, length);
    sub[length] = '\0';
    printf("%s\n", sub);
}