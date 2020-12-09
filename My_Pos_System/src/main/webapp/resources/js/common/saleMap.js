saleMap = function(){
	 this.map = new Object();
};

saleMap.prototype = {
	put : function(key, value){
		this.map[key] = value;
	},
	get : function(key){
		if(this.size() == 0)
		return '';
		return this.map[key];
	},
	containsKey : function(key){
		return key in this.map;
	},
	containsValue : function(value){
		for(var prop in this.map){
			if(this.map[prop] == value) return true;
		};
		return false;
	},
	isEmpty : function(){
		return (this.size() == 0);
	},
	clear : function(){
		for(var prop in this.map){
			delete this.map[prop];
		};
	},
	remove : function(key){
		delete this.map[key];
	},
	keys : function(){
		var keys = new Array();
		for(var prop in this.map){
			keys.push(prop);
		};
		return keys;
	},
	values : function(){
		var values = new Array();
		for(var prop in this.map){
			values.push(this.map[prop]);
		};
		return values;
	},
	size : function(){
		var count = 0;
		for (var prop in this.map) {
			count++;
		};
		return count;
	}
};