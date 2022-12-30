#include<iostream>
using namespace std;

class list;
class node{
     public:
   int data;
   node* next;
  
   
   node(int d):data(d),next(NULL){};
   int getdata(){
       return data;
   }
   friend class list;
   
};

class list{
public:
    node* head;
    node* tail;
    
    list():head(NULL),tail(NULL){}
    
    node*begin(){
        return head;
    }
    
    void push_front(int data){
        if(head==NULL){
            node*n = new node(data);
            head = tail = n;
        }
        else{
            node*n = new node(data);
            n->next = head;
            head=n;
        }
    }
    void push_back(int data){
        if(head==NULL){
            node* n = new node(data);
            head = tail = n;
        }
        else{
            node* n = new node(data);
            tail->next = n;
            tail=n;
        }
        
    }
    void insert(int data,int pos){
        if(pos==0){
            push_front(data);
            return;
            
        }
        
    
    //otherwise
    node* temp = head;
    for(int jump=1;jump<pos-1;jump++){
        temp = temp->next;
    }
    node* n= new node(data);
    n->next = temp->next;
    temp->next=n;
    
    
}
};


int main(){
      list l;
    l.push_front(1);
    l.push_front(0);
    l.push_back(2);
    l.push_back(3);
    l.push_back(4);
    l.insert(45, 2);
    
    node* head = l.begin();
    while(head!=NULL){
        cout<<head->getdata()<<"->";
        head=head->next;
    }
    return 0;
}
