package Map_reduce;

public class ReduceObject {
 String id;
 long value;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public long getValue() {
	return value;
}
public void setValue(long value) {
	this.value = value;
}
@Override
public String toString() {
	return "ReduceObject [id=" + id + ", value=" + value + "]";
}

 
}
