function Option(_name, _type, _value, _function) constructor
{
	name = _name;
	type = _type;
	value = _value;
	func = _function;
	
	static Update = function(number, update)
	{
		value[number] = update;
	}
}

function wrap(value, min_,max_)
{
	if (value > max_) then value = min_;
	if (value < min_) then value = max_;
	
	return value;
}