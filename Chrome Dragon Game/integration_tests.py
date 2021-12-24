import serial
import unittest

class TestSum(unittest.TestCase):
    
    def test_extractDigits(self):
        COMPortName = 'COM16'
        serialPort = serial.Serial(COMPortName, 9600)
        self.assertEqual(serialPort.isOpen(), True)


if __name__ == '__main__':
    unittest.main()
