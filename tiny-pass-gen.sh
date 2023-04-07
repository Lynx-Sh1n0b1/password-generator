#!/bin/bash
clear
# Color variables
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Banner
echo -e "${BLUE}*****************************"
echo -e "*     Password Generator    *"
echo -e "*****************************${NC}"

while true; do
  # Prompt user for password length
  echo -e "${YELLOW}Enter the length of the password (5-32):${NC}"
  read length

  # Validate input
  if [[ ! "$length" =~ ^[0-9]+$ ]]; then
    echo -e "${YELLOW}Please enter a valid number.${NC}"
    continue
  fi

  if (( length < 5 || length > 32 )); then
    echo -e "${YELLOW}Please enter a number between 5 and 32.${NC}"
    continue
  fi

  # Prompt user for password complexity
  echo -e "${YELLOW}Enter the complexity of the password:"
  echo -e "1. Letters only"
  echo -e "2. Letters and numbers"
  echo -e "3. Letters, numbers, and symbols${NC}"
  read complexity

  # Generate password(s)
  echo -e "${BLUE}*****************************${NC}"
  echo -e "${YELLOW}Generating Password(s)...${NC}"
  echo -e "${BLUE}*****************************${NC}"
  echo -e "${YELLOW}"

  for i in {1..7}; do
    case $complexity in
      1)
        tr -dc 'a-zA-Z' < /dev/urandom | head -c $length
        ;;
      2)
        tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c $length
        ;;
      3)
        tr -dc 'a-zA-Z0-9!@#$%^&*()-=_+,.?' < /dev/urandom | head -c $length
        ;;
      *)
        echo -e "${YELLOW}Invalid complexity option. Please try again.${NC}"
        continue 2
        ;;
    esac
    echo
  done

  # Ask to generate again
  echo -e "${BLUE}*****************************${NC}"
  echo -e "${YELLOW}Generate again? [y/n]:${NC}"
  read answer

  if [[ "$answer" =~ [Yy] ]]; then
    continue
  else
    break
  fi
done

echo -e "${BLUE}*****************************${NC}"
echo -e "${YELLOW}Bye!${NC}"
echo -e "${BLUE}*****************************${NC}"
