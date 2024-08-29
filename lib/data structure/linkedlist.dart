// LinkedList Implementation using Dart Programming Language
// This linkedlist has 11 methodes :
// 1.lenght() =>return the number of elements in linkedlist to 
// 2.MAX() => to return the largest element with num data type and the largest ascii value for another data types
// 3.MIN() => to return the smallest element with num data type and the smallest ascii value for another data types
// 4.insert() => to insert a new element in the linkedlist in any place
// 5.print() => to print all or some of the elements in linkedlist
// 6.pop() => to delete an element from any place and return the deleted element value
// 7.remove() => to delete an element by it's value
// 8.update() => to update any element in the linkedlist
// 9.swap() => to swap any two elements in the linkedlist
// 10.copy() => to copy the elements of the linkedlist in a new linkedlist 
// 11.operator[] => to access any value by it's element - this methode is useful to loop on the linkedlist elements
// 12.operator= => to assign a list to the linkedlist easly
// 13.operator+ to Concatenate a new linkedlist to this linkedlist
// 14.indexof() => to get the index of a speceific value

// Mohand Elsebaey

import 'dart:io';

class Node<DataType>{
  // the value which will be stored in the node
  DataType? _item;
  // object to accsses next node
  Node? _next = null;
  // this attribute to accsess linkedlist lenght
  int _lenght = 0;
  Node([DataType? item = null]){
    this._item = item;
  }
  // a getter methode to the private attribute lenght
  int get lenght => this._lenght;

  // methode to get the largest element in linkedlist
  DataType? MAX(){
    Node? current = this;
    // set the largest to the first num item
    DataType? largest;
    while(current != null){
      if(current._item is num){
        largest = current._item;
      }
      current = current._next;
    }
    // reset current node to the first node
    current = this;
    while(current != null){
      if(current._item is num && current._item > largest){
        largest = current._item;
      }
      current = current._next;
    }
    return largest;
  }

  // methode to insert a new value to linkedlist
  DataType? MIN(){
    Node? current = this;
    DataType? smallest ;
    // set the largest to the first num item
    while(current != null){
      if(current._item is num){
        smallest = current._item;
      }
      // reset current node to the first node
      current = current._next;
    }
    current = this;
    while(current != null){
      if(current._item is num && current._item < smallest){
        smallest = current._item;
      }
      current = current._next;
    }
    return smallest;
  }

  // methode to insert a new value to linkedlist
  void insert({int index = -1,DataType? value}){
    // set index by default to linkedlist lenght
    if(index == -1){
      index = this._lenght;
    }
    // check if index is in linkedlist range
    if(index <= this._lenght && index >= 0){
      // increment linkedlist lenght
      this._lenght++;
      // check if linkedlist is Empty
      if(this._item == null){
        this._item = value;
      }
      else{
        // insert begging case 
        if(index == 0){
          Node? node = Node(this._item);
          Node? third = this._next;
          this._item = value;
          this._next = node;
          node._next = third;
        }
        // insert at end (the default case)
        else if(index == this._lenght){
          Node? node = Node(value);
          Node? last = this;
          while(last!._next != null){
            last = last._next;
          }
          last._next = node;
        }
        // insert middle case (between two nodes)
        else{
          Node? node = Node(value);
          Node? start = this;
          Node? end = this._next;
          for(int i = 0;i<index-1;i++){
            start = start!._next;
            end = end!._next;
          }
          start!._next = node;
          node._next = end;
        }
      }
    }
    // handle out of range error
    else{
      print('Error , Out of Range Index !');
    }
  }

  // print all the elements of the linkedlist by defualt
  // print a part of the elements between start and end
  void print_items({int start = 0,int end = -1}){
    // set lenght to default value
    if(end == -1){
      end = this._lenght-1;
    }
    // check if linkedlist is Empty
    if(this._item == null){
      print('LinkedList Is Empty !');
    }
    else{
      // check if start and end are in range
      if(start >= this._lenght || end >= this._lenght || start < 0 || end < 0){
        print('Error , Out of Range Index !');
      }
      // assert that end is bigger than start
      else if(end < start){
        print("Error , End index must be bigger than Start index !");
      }
      else{
        Node? startNode = this;
        // move start node to the start position
        for(int i = 0;i<start;i++){
          startNode = startNode!._next;
        }
        // print the elements from start to end
        stdout.write('[');
        for(int i = start;i<end+1;i++){
          stdout.write('${startNode!._item}, ');
          startNode = startNode._next;
        }
        print(']');
      }
    }
  }

  // delete a specific element by index and return the deleted element
  DataType? pop([int index = -1]){
    // set index to default value
    if(index == -1){
      index = this._lenght-1;
    }

    // check if index is in range
    if(index >= this._lenght || index < 0){
      print('Error , Out of Range Index !');
      return null;
    }
    else{
      // decrement linkedlist lenght
      this._lenght--;

      // delete the only node in linkedlist
      if(this._lenght == 0){
        DataType? item = this._item;
        this._item = null;
        return item;
      }
      else{
        // delete element from begging
        if(index == 0){
          DataType? deletedItem = this._item;
          this._item = this._next!._item;
          this._next = this._next!._next;
          return deletedItem;
        }

        // delete element from middle (general case)
        else{
          Node? previous = this;
          Node? target = this._next;
          Node? Next = target!._next;
          for(int i = 0;i<index-1;i++){
            previous = previous!._next;
            target = target!._next;
            Next = Next!._next;
          }
          previous!._next = Next;
          return target!._item;
        }
      }
    }
  }

  // delete element by value
  void remove(DataType value){
    // remove the only node in linkedlistt
    if(this._lenght == 1){
      if(value == this._item){
        this._item = null;
        this._lenght--;
      }
      else{
        print("There is no element has this value !");
      }
    }

    // remove the first node value
    else if(value == this._item){
      this._item = this._next!._item;
      this._next = this._next!._next;
      // decrement linkedlist lenght
      this._lenght--;
    }

    // remove value of a node between 2 nodes
    else{
      Node? previous = this;
      Node? target = this._next;
      Node? Next = target!._next;
      while(target!._item != value){
        target = target._next;
        previous = previous!._next;
        Next = Next!._next;
        if(Next == null){
          if(target!._item != value){
            print("There is no element has this value !");
            return ;
          }
        }
      }
      previous!._next = Next;
      // decrement linkedlist lenght
      this._lenght--;
    }
  }

  // method to update an index with a value
  void update({required int index,required DataType value}){
    // check if index is in linkedlist range
    if(index >= this._lenght || index < 0){
      // handle index out of range error
      print('Error , Out of Range Index !');
    }
    else{
        Node? target = this;
      for(int i = 0;i<index;i++){
        target = target!._next;
      }
      target!._item = value;
    }
  }

  // method to swap values of two nodes
  void swap({required int firstIndex,required int secondIndex}){
    // check if indexes is in linkedlist range
    if(firstIndex >= this._lenght || firstIndex < 0 || secondIndex >= this._lenght || secondIndex < 0){
      // handle index out of range error
      print('Error , Out of Range Index !');
    }
    else{
      Node? firstNode = this;
      Node? secondNode = this;
      // move the first node to the target position
      for(int i = 0;i<firstIndex;i++){
        firstNode = firstNode!._next;
      }
      // move the second node to the target position
      for(int i = 0;i<secondIndex;i++){
        secondNode = secondNode!._next;
      }
      // swap the values of the two nodes
      DataType temp = secondNode!._item;
      secondNode._item = firstNode!._item;
      firstNode._item = temp;
    }
  }

  // return value by it's node index
  // this methode can be used if you want to loop on the linkedlist items
  // this methode is useful when linkedlist items is objects to accsess items methods 
  DataType? operator [](int index){
    // check if index is in linkedlist range
    if(index >= this._lenght || index < 0){
      // handle index out of range error
      print('Error , Out of Range Index !');
      return null;
    }
    else{
      Node? target = this;
      for(int i = 0;i<index;i++){
          target = target!._next;
      }
      return target!._item;
    }
  }

  // a function to return a copy of the linkedlist
  Node<DataType> copy(){
    Node<DataType> copy = Node();
    Node? current = this;
    while(current != null){
      copy.insert(value: current._item);
      current = current._next;
    }
    return copy;
  }

  // function to get the index of a speceific value
  int? indexof(DataType value){
    Node? current = this;
    for(int i = 0;i<this._lenght;i++){
      if(current!._item == value){
        return i;
      }
      else{
        current = current._next;
      }
    }
    print("Error , this value isn't exist in the linkedlist");
    return null;
  }

  // operator overloading to Concatenate a new linkedlist to this linkedlist
  Node<DataType> operator+ (Node<DataType> list){
    Node<DataType> origin = Node();
    Node? current = this;
    // add the elements of the linkedlist in the origin 
    while(current != null){
      origin.insert(value: current._item);
      current = current._next;
    }
    // add the elements of the other linkedlist in the origin
    for(int i = 0;i<list.lenght;i++){
      origin.insert(value: list[i]);
    }
    return origin;
  }

  // operator overloading to assign an array easliy to our linkedlist
  void operator >=(List<DataType> list){
    for(DataType elememt in list){
      this.insert(value: elememt);
    }
  }
}