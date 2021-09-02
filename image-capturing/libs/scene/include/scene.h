#ifndef SCENE_H
#define SCENE_H

#include <opencv2/opencv.hpp>
#include <string>

#if __linux__
#include "kinect.h"
#endif
namespace scene {

void write(std::vector<cv::Mat> scene);

void load(std::vector<cv::Mat>& scene);

#if __linux__
cv::Mat grabFrame(std::shared_ptr<Kinect>& sptr_kinect);
#endif

void project(const std::string& window, const int& w, const int& h,
    cv::Mat& img, const cv::Mat& R, const cv::Mat& t);

cv::Mat displayColor(const bool& contrast, const int& w, const int& h);

#if __linux__
void alternateDisplayColor(std::shared_ptr<Kinect>& sptr_kinect,
    const std::string& window, const int& w, const int& h,
    std::vector<cv::Mat>& scene);
#endif

void undistort(cv::Mat& frame);

void saturate(const cv::Mat& src, cv::Mat& dst);

cv::Rect findProjectionArea(const cv::Mat& background, const cv::Mat& foreground);

}
#endif // SCENE_H
