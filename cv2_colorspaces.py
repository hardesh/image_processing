#!/usr/bin/env python

"""
References:
https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_imgproc/py_colorspaces/py_colorspaces.html
https://stackoverflow.com/questions/45070661/pythonopencv-how-to-plot-hsv-range/45071147#45071147
https://www.learnopencv.com/color-spaces-in-opencv-cpp-python/


"""

import cv2
import numpy as np

cap = cv2.VideoCapture(0)


def get_color(converter ,frame , lower_color, upper_color):
    mask = cv2.inRange(converter, lower_color, upper_color)
    res = cv2.bitwise_and(frame, frame, mask = mask)

    # cv2.imshow("frame", frame)
    # cv2.imshow("mask", mask)
    cv2.imshow("res", res)

    return res

while(1):

    _, frame = cap.read()

    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    lower_blue = np.array([110,50,50])
    upper_blue = np.array([130,255,255])

    get_color(hsv, frame, lower_blue, upper_blue)

    # usually k is a very big value
    k = cv2.waitKey(10) & 0xFF

    # breaks when Esc is pressed
    if k == 27:
        break


cv2.destroyAllWindows()

