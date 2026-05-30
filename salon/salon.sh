#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  else
    echo "Welcome to My Salon, how can I help you?"
  fi

  # list available services

  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  if [[ -z $SERVICES ]]
  then
    echo -e "Sorry, we don't have any services available."
  else
    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
  fi

  # read service to book

  read SERVICE_ID_SELECTED

  # check if service exists
  SERVICE_AVAILABILITY=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_AVAILABILITY ]]
  then
    # send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    # ask for phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]] 
    then
      # get new customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # get service time
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/^ *$//g')
    CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed 's/^ *$//g')
    echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
    read SERVICE_TIME
    
    # add new service
    echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
    INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
}

MAIN_MENU