#ifndef UNITY_TESTS_HPP
# define UNITY_TESTS_HPP

# include <limits>
# include <string>
# include <iostream>
# include <cassert>

template <typename A>
inline void Assert(A assertion) { if (!assertion) throw std::exception(); }

void execute_tests(void);

#endif
