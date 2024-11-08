# Length

length($_);

|||
|---|---|
|`push(@arr, 'X')`|`1, 2, 3, 4, 5, X`|
|`pop`|`1, 2, 3 ,4`|
|`shift(@arr)`|`2, 3, 4, 5`|
|`unshift(@arr, 'X')`|`X, 1 ,2 ,3 ,4, 5`|


# sort

sort @array: Sorts alphabetically (lexical order).
sort { $a <=> $b } @array: Sorts numerically in ascending order.
sort { $b <=> $a } @array: Sorts numerically in descending order.
sort { $hash{$a} <=> $hash{$b} } keys %hash: Sorts hash keys by their values in ascending order.


# Array Reference

||||
|---|---|---|
List | `(1, 2, 3, 4)`|
ArrayReference | `[1,2,3,4]`|
