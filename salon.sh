#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
MAIN(){
 
  echo "$($PSQL "SELECT service_id,name FROM services")" | while IFS='|' read SERVICE_ID NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done

  echo "Which?"
  read SERVICE_ID_SELECTED
  NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | xargs)
  if [[ -z $NAME ]]
  then
    MAIN
    return
  fi

  echo -e '\nPhone?'
  read CUSTOMER_PHONE
  CUSTOMER_PHONE_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
    echo -e '\nName?'
    read CUSTOMER_NAME
    ADD_NAME=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  echo -e '\nTime?'
  read SERVICE_TIME
  ADD_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

  echo -e "\nI have put you down for a $NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
MAIN