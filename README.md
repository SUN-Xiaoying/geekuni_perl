# Flags
|Flags|Meaning|
|---|---|
|`i`|Case insensitive|
|`m`|Multi lines matching|
|`s`|Single line matching|
|`x`|Extend mode (ignore white-space)|
|`g`|Global matching|
|`e`|Evalue replacement|
|`a`|ACII matching|

# Keys

|Keys|Meaning|
|---|---|
|`\s`|whitespace|
|`\w`|A word character (`\w: [a-zA-Z0-9_]`)|
|`\b`|word boundary|
|`\B `|The opposite of a word boundary: a position where a word boundary does not exist.|
|`\U`|uppercase|

# Method

|Methods|Meaning|
|---|---|
|`chomp($line)`|Removes only the trailing \n (or whatever $/ is)|
|`chop`|Removes the last character of a string, regardless of what it is|

# Length

length($_);

|||
|---|---|
|`push(@arr, 'X')`|`1, 2, 3, 4, 5, X`|
|`pop`|`1, 2, 3 ,4`|
|`shift(@arr)`|`2, 3, 4, 5`|
|`unshift(@arr, 'X')`|`X, 1 ,2 ,3 ,4, 5`|


# sort

```perl
sort @array # Sorts alphabetically (lexical order).

sort { $a <=> $b } @array # Sorts numerically in ascending order.

sort { $b <=> $a } @array # Sorts numerically in descending order.

sort { $hash{$a} <=> $hash{$b} } keys %hash # Sorts hash keys by their values in ascending order.

```
# Loop

```perl
foreach my $element (@array) {
    if (exists $hash{$element}) {
        
    }
}
```

# Reference

|Origin `()`|Reference|Call|
|---|---|---|
|`my @arr = (1,2,3,4)`|`$arr_ref = [1,2,3,4]`|`my @my_arr = @$arr_ref;`
|` my %hash = (a=>1, b=>2)`|`my $hashref = { a=>1, b=>2 };`|
||`my $r_sub = sub { return 'bar'; };`|`&$r_sub();`|

```perl
my @array = (1, 2, 3);
for my $element (@array) {
    say $element;
}
```

```perl
my %hash = (a => 1, b => 2, c => 3);
for my $key (keys %hash) {
    say "$key => $hash{$key}";
}
```

