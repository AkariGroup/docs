import os
import launch
import launch.actions
import launch.substitutions
import launch_ros.actions
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():
    return launch.LaunchDescription([
        launch.actions.DeclareLaunchArgument(
            'prefix',
            default_value=[
                launch.substitutions.EnvironmentVariable('USER'), '_'],
            description='Prefix for node names'),
        # hello_akari_world_sampleを実行する
        launch_ros.actions.Node(
            package='hello_akari_world', executable='hello_akari_world_sample', output='screen',
            name=[launch.substitutions.LaunchConfiguration(
                'prefix'), 'hello_akari_world_sample']
        ),
        # hello_akari_display_sampleを実行する
        launch_ros.actions.Node(
            package='hello_akari_display', executable='hello_akari_display_sample', output='screen',
            name=[launch.substitutions.LaunchConfiguration(
                'prefix'), 'hello_akari_display_sample']
        ),
        # OpenVINOのlaunchファイルを実行する
        launch.actions.IncludeLaunchDescription(
            launch.launch_description_sources.PythonLaunchDescriptionSource(
                get_package_share_directory(
                    'dynamic_vino_sample') + '/launch/pipeline_people_akari.launch.py'))
    ])
