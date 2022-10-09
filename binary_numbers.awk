# gawk binary number functions
# RPC 09OCT2022

# convert an 8 bit binary number to an integer
function bin_to_n(i)
{
    n = 0;
    #printf(">> %s:", i);
    for (k = 1; k < 9; k++) {
        n = n * 2;
        b = substr(i, k, 1);
        if (b == "1") {
            n = n + 1;
        }
    }
    return (n);
}

# convert a number to a binary number
function dectobin(n)
{
    printf("dectobin: n in %d ",n);
    binstring = "0b"; # some c compilers allow 0bXXXXXXXX format numbers
    bn = 128;
    for(k=0;k<8;k++) {
        if (n >= bn) {
            binstring = binstring "1";
            n = n - bn;
        } else {
            binstring = binstring "0"
        }
	printf(" bn %d",bn);
	bn = bn / 2;
    }
    return binstring;
    }

BEGIN {
    FS = " ";

    # gawk (I think) has no atoi() funciton or equiv. So a table of all 
    # chars (well 256 ascii) can be used with the index function to get 
    # round this
    for (i = 0; i < 255; i++) {
       table = sprintf("%s%c", table, i);
    }
}

{
	# assume on stdin a buffer of 8 bit binary numbers "01000001 01000010" is AB etc
    for (i = 1; i <= NF; i++)
        printf("bin-num#%d: %x --> %c\n", i, bin_to_n($i), bin_to_n($i));

    s = "ABC123string to test";
    for (i = 0; i < length(s); i++) {
	nn = index(table, substr(s,i+1,1))-1;
	printf("substr  :%s:%x:",ss,nn);
        printf(" :%d: %s\n", i, dectobin(nn));
    }
}

