import cv2
import numpy as np
# from matplotlib import pyplot as plt

img = cv2.imread('../../images/jurassic-world.jpg')

blurred = cv2.blur(img,(5,5))

cv2.imwrite("../../images/output/blur.jpg", blurred)

# plt.subplot(121),plt.imshow(img),plt.title('Original')
# plt.xticks([]), plt.yticks([])
# plt.subplot(122),plt.imshow(dst),plt.title('Averaging')
# plt.xticks([]), plt.yticks([])
# plt.show()