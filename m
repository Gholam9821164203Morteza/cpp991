#include <iostream>
using namespace std;

class myArray{
    double *a;
    int n;
    void copy(const myArray& b)
    {
        n=b.n;
        for(int i=0;i<n;i++)
            a[i]=b.a[i];
    }
    public:
    myArray(const double *ma,const int k){
        n = k;
        a=new double[n];
        for(int i = 0; i < n; i++)
            *(a+i) = *(ma+i);
        cout << "constructor:";
        for(int i=0; i < n ; i++)
            cout << *(a+i) << " ";
        cout << endl;
    }
    myArray(const myArray &b){
        a = new double[n = b.n];
        cout << "copy constructor:";
        for(int i=0 ; i<n ; i++)
            copy(b);
        cout << endl;
    }
    void print(void){
        cout << "n = " << n << endl;
        for(int i = 0; i < n; i++)
            cout << "[" << i << "] = " << *(a+i) << endl;
        cout << endl;
    }
    void operator=(const myArray& b){
        cout << "assingment myArray" << endl;
        copy(b);
    }
    ~myArray(){
        cout << "destructor:";
        for(int i=0; i < n ; i++)
            cout << *(a+i) << " ";
        cout << endl;
    };
};

void f1(void);

int main(){
    f1();
    return 0;
}

void f1(void){
    int Size = 4;
    double *x=new double[Size];
    x[0]=10,x[1]=12,x[2]=34,x[3]=54;
    double *y=new double[Size];
    myArray d(x,Size);
    myArray a(d);
    cout << "myArray d:" << endl;
    d.print();
    a=d;
    cout << "myArray a:" << endl;
    a.print();
}
