# Created by the script cgal_create_cmake_script
# This is the CMake script for compiling a CGAL application.

project(Surface_mesh_topology_Examples)

cmake_minimum_required(VERSION 3.1)

find_package(CGAL QUIET COMPONENTS Qt5)
if(CGAL_Qt5_FOUND)
    add_definitions(-DCGAL_USE_BASIC_VIEWER -DQT_NO_KEYWORDS)
endif()

# add_definitions(-DCGAL_TRACE_PATH_TESTS)

if ( CGAL_FOUND )

  # create a target per cppfile
  file(GLOB cppfiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
  foreach(cppfile ${cppfiles})
    create_single_source_cgal_program( "${cppfile}" )
  endforeach()

  if(CGAL_Qt5_FOUND)
    target_link_libraries(path_homotopy PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(basic_example_surface_mesh_topology PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(basic_example_torus PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(open_path_homotopy PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(surface_mesh_topology_with_sm_and_polyhedron PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(unsew_edgewidth_repeatedly PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(shortest_noncontractible_cycle_through_a_vertex PUBLIC CGAL::CGAL_Qt5)
    target_link_libraries(shortest_noncontractible_cycle_using_BFS PUBLIC CGAL::CGAL_Qt5)
  endif()

else()
  
  message(STATUS "This program requires the CGAL library, and will not be compiled.")
  
endif()
