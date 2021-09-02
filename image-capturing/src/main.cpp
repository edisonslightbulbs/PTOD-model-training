#include <string>
#include <opencv2/opencv.hpp>

#include "kinect.h"

cv::Mat grabFrame(std::shared_ptr<Kinect>& sptr_kinect)
{
    sptr_kinect->capture();
    sptr_kinect->depthCapture();
    sptr_kinect->pclCapture();
    sptr_kinect->imgCapture();
    sptr_kinect->c2dCapture();
    sptr_kinect->transform(RGB_TO_DEPTH);

    auto* rgbData = k4a_image_get_buffer(sptr_kinect->m_c2d);
    int w = k4a_image_get_width_pixels(sptr_kinect->m_c2d);
    int h = k4a_image_get_height_pixels(sptr_kinect->m_c2d);

    cv::Mat frame
            = cv::Mat(h, w, CV_8UC4, (void*)rgbData, cv::Mat::AUTO_STEP).clone();

    sptr_kinect->releaseK4aCapture();
    sptr_kinect->releaseK4aImages();

    return frame;
}

#define ENTER_KEY 13
#define ESCAPE_KEY 27

int main()
{
    // initialize camera, image frames, and  window
    cv::Mat image;
    std::shared_ptr<Kinect> sptr_kinect(new Kinect);

    const std::string WINDOW = "image-capture window";
    cv::namedWindow(WINDOW, cv::WINDOW_AUTOSIZE);

    std::string file;
    int num = 0;

    // capturing images
    bool done = false;
    while (!done) {
        image = grabFrame(sptr_kinect);

        cv::imshow(WINDOW, image);
        int key = cv::waitKey(30);

        switch (key) {
            case ENTER_KEY: // capture images
                num++;
                file  = "output/captured/" + std::to_string(num) + "_scene.png";
                std::cout << "# " << num << " image captured" << std::endl;
                cv::imwrite(file , image);
                break;
            case ESCAPE_KEY: // exit capture loop
                done = true;
            default:
                break;
        }
    }
    return 0;
}
