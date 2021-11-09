import unittest
from app import app


class TestApp(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tester = app.test_client(cls)

    def test_index(self):
        response = self.tester.get('/')
        status_code = response.status_code
        self.assertEqual(status_code, 200)
