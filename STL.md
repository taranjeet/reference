Well as promised Desypy, here is the tutorial.

Ok, So You know C, you can write some code in C++ but is confused from where 
to learn STL. Some will suggest read topcoder tutorial but I will suggest
that just read about vectors in the beginning. They are everything.

So what are vectors? 

Vectors are dynamic arrays meaning their size is decided at the runtime.
They can be declared using 
```cpp
vector<int>a;
```

This just declares what you can call as an array but remember its size is
dynamic. Now you must be thinking of how to insert elements into it.
So there is a function named **push_back**, which can be used for inserting 
elements. Biggest advantage is the size is dynamic meaning that you can 
insert any number of elements. This is useful in case the size of array is not known.
Like

```cpp
vector<int>a;

for(int i=0;i<=n;i++)
a.push_back(i);
```
On the other hand if the size of array is known, you can also resize the vector as

```cpp
a.resize(n);
``` 

Now when you need to sort the vector just write
```cpp
sort(a.begin(),a.end());
```
Wow sorting done.

Remember that vector are also indexed like array meaning a[0] will return the first
element of the vector.

For now being,this much will be sufficient for you to solve 50 problems. 
Note the changes that you need to make for a c++ program(I am writing down my template).

```cpp
#include<bits/stdc++.h>
using namespace std;
int main(){
	return 0;
}
```