function comb(){
	let s=document.getElementById("str").value;
var buff = [];
var res = [];
for (i=0;i<s.length;i++){
    buff = [s[i]];
    var index=0;
    while(res[index]){
        buff.push(''+res[index]+s[i]);
        index++;
    }
    res = res.concat(buff);
}
document.getElementById("demo").innerHTML=res;
}

