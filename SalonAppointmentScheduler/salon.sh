#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICES_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # get service
  read SERVICE_ID_SELECTED

  # check service id is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICES_MENU "I could not find that service. What would you like today?"
  else
    # get service name if exists
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]
    then
      SERVICES_MENU "I could not find that service. What would you like today?"
    fi
  fi

}

SERVICES_MENU

# trim spaces from service name
SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/ |/"/')

# get customer phone
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone = '$CUSTOMER_PHONE'")

# if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
  # get new customer name
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  # insert new customer
  INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
fi 

# trim spaces from customer name
CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ |/"/')

# get customer id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get appointment time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# add appointment
INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
