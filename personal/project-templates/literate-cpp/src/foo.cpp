// [[file:../main.org::_implementation][_implementation]]
// include header itself...
#include "foo.hpp"

// any other dependencies needed for this "module's" code...
#include <iostream>
#include <string>

namespace foo
{
  //Example bar function
  void bar() {
    std::string helloWorld { "Hello World" };
    std::cout << helloWorld << '\n';
  }

} // end namespace foo
// _implementation ends here
