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
