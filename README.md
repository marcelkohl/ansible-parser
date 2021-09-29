# ansible-replacer
Script to parse ansible variables style from .env variables 

Basically it reads a file, search for expressions like {{ MY_VAR_SOMETHING }} and output the content of the source file replacing the expressions with the respective .env variable.

# Running
`sh parse.sh source-file.json`
