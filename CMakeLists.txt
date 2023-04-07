cmake_minimum_required(VERSION 3.0)

project(arxes_glosson)

find_package(BISON)
find_package(FLEX)

BISON_TARGET(parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.c)
FLEX_TARGET(lexer lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.yy.c)
ADD_FLEX_BISON_DEPENDENCY(lexer parser)


include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(arxes_glosson ${BISON_parser_OUTPUTS} ${FLEX_lexer_OUTPUTS})
