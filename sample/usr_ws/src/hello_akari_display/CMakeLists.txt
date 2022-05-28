cmake_minimum_required(VERSION 3.5)
project(hello_akari_display)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(object_msgs REQUIRED)
find_package(m5serial_msgs REQUIRED)

add_executable(hello_akari_display_sample src/hello_akari_display_sample.cpp)
ament_target_dependencies(hello_akari_display_sample
rclcpp object_msgs m5serial_msgs)


install(TARGETS
hello_akari_display_sample
DESTINATION lib/${PROJECT_NAME})

install(DIRECTORY
launch
DESTINATION share/${PROJECT_NAME}
)

ament_package()
