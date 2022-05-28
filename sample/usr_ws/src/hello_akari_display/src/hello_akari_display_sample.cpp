#include <memory>
#include "rclcpp/rclcpp.hpp"
#include "object_msgs/msg/objects_in_boxes.hpp"
#include "m5serial_msgs/srv/set_display_color.hpp"
#include "m5serial_msgs/srv/set_display_text.hpp"
#include <stdio.h>
#include <unistd.h>

using std::placeholders::_1;

/**
* 顔認識したら"Hello!"と表示するクラス"
*/
class HelloAkariDisplay : public rclcpp::Node
{
public:
    HelloAkariDisplay()
        : Node("hello_akari_display")
    {

        face_sub_ = this->create_subscription<object_msgs::msg::ObjectsInBoxes>(
            "/ros2_openvino_toolkit/face_detection", 10, std::bind(&HelloAkariDisplay::topic_callback, this, _1));
        display_color_cli_ =
            this->create_client<m5serial_msgs::srv::SetDisplayColor>("/set_display_color");
        display_text_cli_ =
            this->create_client<m5serial_msgs::srv::SetDisplayText>("/set_display_text");
    }

private:
    bool isDetected = false; //顔検出のステータスを保持。ディスプレイ表示を更新するかの判定に使う。

    /**
    * OpenVINOの顔認識結果をsubscribeしたときに実行されるCallback関数
    */
    void topic_callback(const object_msgs::msg::ObjectsInBoxes::SharedPtr msg)
    {
        auto color_req = std::make_shared<m5serial_msgs::srv::SetDisplayColor::Request>();
        auto text_req = std::make_shared<m5serial_msgs::srv::SetDisplayText::Request>();
        //画面中央にサイズ5で文字表示
        text_req->pos_x = -999;
        text_req->pos_y = -999;
        text_req->size = 5;
        text_req->refresh = true;
        if (msg->objects_vector.size() > 0 && isDetected == false)
        {
            //顔検出かつ前のステータスが未検出の場合
            RCLCPP_INFO(this->get_logger(), "Hello akari display!");
            //背景を白に！
            color_req->color = "white";
            auto color_res = display_color_cli_->async_send_request(color_req);
            //黒文字で"Hello!"と表示
            text_req->text = "Hello!";
            text_req->text_color = "black";
            text_req->back_color = "white";
            isDetected = true;
            auto text_res = display_text_cli_->async_send_request(text_req);
            //挨拶は3秒！
            sleep(3);
        }
        else if (msg->objects_vector.size() == 0 && isDetected == true)
        {
            //顔未検出かつ前のステータスが検出の場合
            //背景を黒に！
            color_req->color = "black";
            auto color_res = display_color_cli_->async_send_request(color_req);
            //白文字で"AKARI"と表示
            text_req->text = "AKARI";
            text_req->text_color = "white";
            text_req->back_color = "black";
            isDetected = false;
            auto text_res = display_text_cli_->async_send_request(text_req);
        }
    }

    rclcpp::Subscription<object_msgs::msg::ObjectsInBoxes>::SharedPtr face_sub_;
    rclcpp::Client<m5serial_msgs::srv::SetDisplayColor>::SharedPtr display_color_cli_;
    rclcpp::Client<m5serial_msgs::srv::SetDisplayText>::SharedPtr display_text_cli_;
};

/**
*メイン関数
*/
int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<HelloAkariDisplay>());
    rclcpp::shutdown();
    return 0;
}
