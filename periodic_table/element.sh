#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

# function for printing info string given atomic_number

OUTPUT_ATOMIC_NUMBER() {
  if [[ -z $1 ]] # check empty input
  then
    echo OUTPUT_ATOMIC_NUMBER empty input
  else
    # get info from database
    ELEMENTS_PROPERTIES_RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number='$1'")
    if [[ -z $1 ]] # error check
    then
      echo ERROR: ELEMENTS_PROPERTIES_RESULT not found
    else
      # read info into printable variables
      echo "$ELEMENTS_PROPERTIES_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR MASS BAR MELTING_POINT BAR BOILING_POINT
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    fi
  fi
}

# function for printing info string given symbol

OUTPUT_SYMBOL() {
  if [[ -z $1 ]] # check empty input
  then
    echo OUTPUT_SYMBOL empty input
  else
    # get atomic number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    # run atomic number function
    OUTPUT_ATOMIC_NUMBER "$ATOMIC_NUMBER"
  fi
}

# function for printing info string given name

OUTPUT_NAME() {
  if [[ -z $1 ]] # check empty input
  then
    echo OUTPUT_NAME empty input
  else
    # get atomic number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    # run atomic number function
    OUTPUT_ATOMIC_NUMBER "$ATOMIC_NUMBER"
  fi
}

# check if no input
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
elif [[ "$1" =~ ^[0-9]+$ ]] # check if intput is a number
then
  # check atomic numbers

  # get atomic number from input
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1'")
  # if atomic number not found
  if [[ -z $ATOMIC_NUMBER ]]
  then
    # end program
    echo I could not find that element in the database.
  else
    # output info using atomic number
    OUTPUT_ATOMIC_NUMBER $ATOMIC_NUMBER
  fi
else
  # check symbols

  # get symbol from input
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'")
  # if symbol exists
  if [[ -n $SYMBOL ]]
  then
    # output info using symbol
    OUTPUT_SYMBOL $SYMBOL
  else
    # check names

    # get name from input
    NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'")
    # if name exists
    if [[ -n $NAME ]]
    then
      # output info using name
      OUTPUT_NAME $NAME
    else
      # end program
      echo I could not find that element in the database.
    fi
  fi
fi