#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^-?[0-9]+$ ]] 
  then
    EP=$($PSQL "SELECT elements.atomic_number, symbol, name, typ, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
  else
    EP=$($PSQL "SELECT elements.atomic_number, symbol, name, typ, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1' OR symbol='$1'")
  fi
  if [[ -z $EP ]]
  then
    echo I could not find that element in the database.
  else
    echo "$EP" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
    do
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi