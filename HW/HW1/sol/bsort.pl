sub bsort {
   for ($i=0;$i<$#_;$i++) {
     for ($j=$#_;$i<$j;$j--) {
       if ($_[$j]<$_[$j-1]) {
          ($_[$j],$_[$j-1])=($_[$j-1],$_[$j]);
       }
     }
   }
}
print "Enter integers in a line: ";
@a=split ' ',<>;
bsort @a;
print "After sorting: @a\n";
