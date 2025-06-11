#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")

SERVICE_LIST(){

  if [[ $1 ]]
  then
    echo $1
  fi

  echo "$SERVICES" | while read ID BAR SERVICE_NAME
  do
    echo "$ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  SERVICE_SELECTED_EXIST_RESULT=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_SELECTED_EXIST_RESULT ]]
  then
    SERVICE_LIST "I could not find that service. What would you like today?"
  else
    CUSTOMER_IDENTIFICATION
  fi
}

CUSTOMER_IDENTIFICATION(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_ADD_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    APPOINTMENT
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
    APPOINTMENT
  fi
}

APPOINTMENT(){
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

SERVICE_LIST