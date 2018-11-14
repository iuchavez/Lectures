// Isaac Chavez
// Professor Neil Terell
// Organization of Programming Lang
// CECS 424

class ConsList<T>{
	T head;
	ConsList<T> tail;
}

ConsList<Integer> a = cons(1, cons(2, cons(3, null)));

// Simple Imerative implemetation of that function
static boolean contains<T>(ConsList<T> list, T data){
	ConsList<T> temp = list;
	while(temp != null && temp.head != data)
		temp = temp.tail;
	return temp!= null;
}

static boolean contains<T>(ConsList<T> list, T data){
	if(list == null) return false;
	if(list.head == data) return true;
	return contains(list.tail, data);
}

// ConsList<Integer> a = cons(1, cons(2, cons(3, null)));
// ConsLists are immutable
b = cons(4,a);
c = a.tail;

// a: 1,2,3
// b: 4,1,2,3
// c: 2,3

static removeFirst(ConsList<T> list, T data){
	if(list == null){ return null; }
	if (list.head == data) { return list.tail }
	return cons(list.head, removeFirst(list.tail, data));

}

// ConsList<Integer> a = cons(1, cons(2, cons(3, null)));
// ConsLists are immutable
b = cons(4,a);
c = a.tail;
d = remove(b, 1);

// a: 1,2,3
// b: 4,1,2,3
// c: 2,3
// d = 4,2,3

	b->[4]->[1]->[2]->[3]
list---^		  ^
d-->[4]-----------|

static ConsList append(ConsList<T> a, ConsList<T> b){
	if(a == null) return b;
	return cons(a.head, append(a.tail, b))
}

// ConsList<Integer> a = cons(1, cons(2, cons(3, null)));
// ConsLists are immutable
b = cons(4,a);
c = a.tail;
d = remove(b, 1);
e.append(b,d);

// a: 1,2,3
// b: 4,1,2,3
// c: 2,3
// d: 4,2,3
// e: 4,1,2,3,4,2,3 

b -> 4 -> 1 -> 2 -> 3
d -> 4 --------^
e -> 4 -> 1 -> 2 ->

// What would be a legit reason for wanting a ConsList which is immutable
ConsList<Student> students = ... ; // in order by grade
ConsList<...> temp = students;
while (temp != null && temp.head.grade < 90)
	temp = temp.tail;


static ConsList<T> filter(Predicate<T> p, ConsList<T> list){
	if(list == null) return null;
	if( p (list.head)) return cons(list.head, filter(p, list.tail));
	else {return filter(p,list.tail);}
}
