# Script to report versions of all agda-pages software depedencies

print_and_exec(){
  printf "\n%s: %s %s\n\n" "$1" "$2" "($3)"
  $2
  printf "\n"
}

printf "Agda-Pages websites are currently generated using the versions listed below.\n"
printf "Use of different versions may affect the generated websites or lead to errors.\n"

print_and_exec "Agda" "agda --version" ">= 2.8.0"

print_and_exec "Awesome-nav" "pip show mkdocs-awesome-nav" ">= 3.3.0"

print_and_exec "GNU Make" "make --version" ">= 3.81"

print_and_exec "MaterialX" "pip show mkdocs-materialx" ">= 10.2.0"

print_and_exec "mike" "mike --version" ">= 2.2.0"

print_and_exec "MkDocs" "mkdocs --version" "1.6.1"

print_and_exec "pip" "pip --version" ">= 26.2.1"

print_and_exec "Python 3" "python3 --version" ">= 3.14.7"

print_and_exec "sd" "sd --version" "1.0.0"
