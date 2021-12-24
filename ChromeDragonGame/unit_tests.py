from main import extractDigits
from main import load_image
import pygame
import unittest

class TestSum(unittest.TestCase):

    def test_extractDigits(self):
        self.assertEqual(extractDigits(6), [0,0,0,0,6])
        self.assertEqual(extractDigits(45), [0,0,0,4,5])
        self.assertEqual(extractDigits(762), [0,0,7,6,2])

if __name__ == '__main__':
    unittest.main()
