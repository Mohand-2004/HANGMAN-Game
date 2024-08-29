// Stack Implementation using Dart Programming Language
// This Stack has 8 methodes :
// 1.lenght() => to return the number of elements in Stack
// 2.MAX() => to return the largest element with num data type and the largest ascii value for another data types
// 3.MIN() => to return the smallest element with num data type and the smallest ascii value for another data types
// 4.push() => to insert a new element in the end of the Stack
// 5.pop() => to delete and return the last element in the Stack
// 6.print() => to print all or some of the elements in Stack
// 7.peek() => to get the current element
// 8.operator[] => to access any value by it's element - this methode is useful to loop on the Stack elements

// Mohand Elsebaey


import 'dart:io';
import 'linkedlist.dart';

class Stack<DataType>{
  final Node<DataType> _linkedlist = Node();

  // function to get stack lenght
  int lenght(){
    return this._linkedlist.lenght;
  }

  // function to get the maximum element in the stack
  DataType? MAX(){
    return this._linkedlist.MAX();
  }

  // function to get the minimum element in the stack
  DataType? MIN(){
    return this._linkedlist.MIN();
  }

  // function to insert a new value to the stack
  void push(DataType value){
    this._linkedlist.insert(value: value);
  }

  // function to delete and return the last value of the stack
  DataType? pop(){
    if(this._linkedlist.lenght == 0){
      stdout.write("Stack Under Flow !");
      return null;
    }
    else{
      return this._linkedlist.pop();
    }
  }

  // function to print all or some of the elements in Stack
  void print({int start = 0,int end = -1}){
    if(this._linkedlist.lenght == 0){
      stdout.write("Stack Under Flow !");
    }
    else{
      this._linkedlist.print_items(start: start,end: end);
    }
  }

  // function to get the current element
  DataType? peek(){
    if(this._linkedlist.lenght == 0){
      stdout.write("Stack Under Flow !");
      return null;
    }
    else{
      return this._linkedlist[this._linkedlist.lenght-1];
    }
  }

  // operator overloading to an element from a a specific position
  DataType? operator [](int index){
    return this._linkedlist[index];
  }
}