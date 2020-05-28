import cv2
# load the image and show it
image = cv2.imread("../../images/jurassic-world.jpg")
# cv2.imshow("original", image)
# cv2.waitKey(0)

cropped = image[70:170, 440:540]
# cv2.imshow("cropped", cropped)
# cv2.waitKey(0)

cv2.imwrite("../../images/output/crop.jpg", cropped)