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
        temp->next;
    }
    node* n= new node(data);
    n->next = temp->next;
    temp->next=n;
    
    
}
    
  
    void pop_front(){
        node* temp = head;
        head = head->next;
        temp->next = NULL;
        delete temp;
    }
    
    void pop_back(){
        
        node* temp1 = head;
        node* temp2 = head;
        while(temp1->next!=NULL){
            temp2=temp1;
            temp1=temp1->next;
        }
        temp2->next=NULL;
        delete temp1;
        
    }
    
    void pop(int idx){
        node* p1 = head;
        node* p2 = head;
        int count=0;
        
        while(idx!=count){
            p1=p2;
            p2=p2->next;
            count++;
            if(idx==count){
                p1->next=p2->next;
                break;
            }
           
        }
        
    }
};



int main(){
      list l;
    l.push_front(1);
    l.push_front(12);
    l.push_back(2);
    l.push_back(3);
    l.push_back(4);
    l.insert(45, 2);
    l.pop(3);
   
   
    
    node* head = l.begin();
    //listreverse(head);
    while(head!=NULL){
        cout<<head->getdata()<<"->";
        head=head->next;
    }
    
   
   
    
}

