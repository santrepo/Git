#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter operator (+ - * /): " op
read -p "Enter second number: " num2

case $op in
  +)
    echo "Result = $((num1 + num2))"
    ;;
  -)
    echo "Result = $((num1 - num2))"
    ;;
  \*)
    echo "Result = $((num1 * num2))"
    ;;
  /)
    echo "Result = $((num1 / num2))"
    ;;
  *)
    echo "Invalid operator"
    ;;
esac

case variable in
  pattern1) commands ;;
  pattern2) commands ;;
  *) default ;;
esac


#!/bin/bash

read -p "Enter a number (1-7): " day

case $day in
  1) echo "Sunday" ;;
  2) echo "Monday" ;;
  3) echo "Tuesday" ;;
  4) echo "Wednesday" ;;
  5) echo "Thursday" ;;
  6) echo "Friday" ;;
  7) echo "Saturday" ;;
  *) echo "Invalid number" ;;
esac


#!/bin/bash

read -p "Enter a character: " ch

case $ch in
  [aeiouAEIOU]) echo "Vowel" ;;
  [a-zA-Z]) echo "Consonant" ;;
  *) echo "Invalid input" ;;
esac
