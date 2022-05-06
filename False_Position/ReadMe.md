## (root, fx, ea, iter) = falsePosition(func, xl, xu, es, maxit, varargin)
falsePosition is a function that implements a false position root finding method (faster than any graphing calculator on average) that can take a given function, 
and two guesses (must be on either side of the root), to determine an extremely accurate estimate of the root. The program requires only the first three inputs. 
If not given, default es and maxit values will be .0001 and 200, respectively. 

### Inputs-
* func- is the function that is inputed by the user
* xl- is the lower guess
* xu- is the upper guess
* es- is the percent error that the function will stop if the approximate
* error goes under that value
* maxit- the maximum number of iterations the program will run before
* spitting out an answer, even if it doesn't reach the desired es value
* varargin- any other parameters from the function
### Outputs-
* root- the solved root of the equation 
* fx- the y value of that calculated root
* ea- the approximate error
* iter- the number of iterations it took to find that root
