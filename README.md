**carry_lookahead_adder**

A generic n-bit carry lookahead adder. The carry lookahead adder works by calculating the carry bit before the full adder is done. This type of adder is faster than the ripple carry adder, but uses more logic resources.

**debounce**

When a mechanical button is pressed it often changes between being pressed and not being pressed due to the bouncing of the metal. This vhdl module takes this "dirty" signal and outputs a clean signal.

**fifo_register**

This register based FIFO is different from a block RAM FIFO in so far that it uses distributed logic resources to store data. It should only be used when a small memory is needed. This module has a full-flag and an empty-flag aswell as assertions to check for overflow and underflow.

**fir_filter**

The FIR filter module accepts an array of filter coefficients and a stream of sampled data. Based on these parameters it computes the the convolution of those two functions and outputs the filtered results.

**full_adder**

A standard digital full adder with two 1-bit inputs and a carry input. This module computes the addition of the given inputs and outputs a sum aswell as a carry out bit.

**half_adder**

This module is a simple half adder which computes the addition of two 1-bit inputs and gives back the sum aswell as a carry out if computed.

**ripple_carry_adder**

A variable sized cascaded chain of full adders. The module will compute the addition of any 2 n-bit numbers by chaining n full adders together. This is the most basic form of addition for 2 numbers.
