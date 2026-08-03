# Script to report versions of all agda2pages software depedencies



print_and_exec(){
  printf "\n%s: %s %s\n\n" "$1" "$2" "($3)"
  $2
  printf "\n"
}

printf "The Agda Pages website was generated using the versions listed below.\n"
printf "Use of different versions may affect the generated website or lead to errors.\n"

print_and_exec "Agda" "agda --version" ">= 2.8.0"

print_and_exec "Awesome-nav" "pip show mkdocs-awesome-nav" ">= 3.3.0"

print_and_exec "GNU Make" "make --version" ">= 3.81"

print_and_exec "Material for MkDocs" "pip show mkdocs-material" ">= 9.7.6"

print_and_exec "mike" "mike --version" ">= 2.0.0"

print_and_exec "MkDocs" "mkdocs --version" "1.6.1"

print_and_exec "pip" "pip --version" ">= 26.0.1"

print_and_exec "Python 3" "python3 --version" ">= 3.14.0"

print_and_exec "sd" "sd --version" "1.0.0"
