#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if argument is numeric then it is atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    # else if argument is 1 or 2 characters then it is symbol
    elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]] 
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE lower(symbol) = lower('$1')")
    else
      # otherwise argument is name
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE lower(name) = lower('$1')")
  fi

  if [[ $ATOMIC_NUMBER -gt 0 ]]
    then
      ELEMENT_INFO=$($PSQL "SELECT symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
      echo "$ELEMENT_INFO" | while IFS="|" read SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
      do 
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo "I could not find that element in the database."
  fi
fi
